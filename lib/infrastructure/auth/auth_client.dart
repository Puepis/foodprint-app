import 'dart:convert';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodprint/domain/auth/i_auth_repository.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/auth/login_failure.dart';
import 'package:foodprint/domain/auth/register_failure.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/core/exceptions.dart';
import 'package:foodprint/infrastructure/local_storage/token_storage_client.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

/// Implements the authentication methods and communicates with the foodprint-backend.
@LazySingleton(as: IAuthRepository)
class AuthClient implements IAuthRepository {
  final TokenStorageClient _storageClient =
      TokenStorageClient(storage: const FlutterSecureStorage());

  @override
  Future<Either<RegisterFailure, Unit>> register(
      {@required Username username, @required Password password}) async {
    final usernameStr = username.getOrCrash();
    final passwordStr = password.getOrCrash();

    http.Response res;
    try {
      res = await http.post("${DotEnv().env['SERVER_IP']}/api/users/register",
          body: {"username": usernameStr, "password": passwordStr});
    } on SocketException {
      return left(const RegisterFailure.noInternet());
    }

    if (res.statusCode == 200) {
      return right(unit);
    } else if (res.statusCode == 401) {
      return left(const RegisterFailure.invalidRegisterCombination());
    } else if (res.statusCode == 409) {
      return left(const RegisterFailure.userAlreadyExists());
    } else {
      return left(const RegisterFailure.serverError());
    }
  }

  @override
  Future<Either<LoginFailure, JWT>> login(
      {@required Username username, @required Password password}) async {
    final usernameStr = username.getOrCrash();
    final passwordStr = password.getOrCrash();

    http.Response res;
    try {
      res = await http.post("${DotEnv().env['SERVER_IP']}/api/users/login",
          body: {"username": usernameStr, "password": passwordStr});
    } on SocketException {
      return left(const LoginFailure.noInternet());
    }

    if (res.statusCode == 200) {
      final json = jsonDecode(res.body);
      final accessToken = JWT(token: json['accessToken'] as String);
      final refreshToken = json['refreshToken'] as String;

      await _storageClient.storeRefreshToken(refreshToken);
      return right(accessToken);
    } else if (res.statusCode == 401) {
      return left(const LoginFailure.invalidLoginCombination());
    } else {
      return left(const LoginFailure.serverError());
    }
  }

  @override
  Future<Option<JWT>> getAccessToken() async {
    // Check if refresh token exists
    String refreshToken;
    try {
      refreshToken = await _storageClient.getRefreshToken();
    } on RefreshTokenNotFoundException {
      return none();
    }

    // Check if refresh token has expired
    final String token = refreshToken;
    final Map<String, dynamic> payload = JWT.getDecodedPayload(token);

    final DateTime expiry =
        DateTime.fromMillisecondsSinceEpoch((payload["exp"] as int) * 1000);

    // Refresh token expired
    if (expiry.isBefore(DateTime.now())) {
      final id = payload['sub'] as String;
      await _storageClient.deleteRefreshToken();

      // Revoke refresh tokens
      await http.post("${DotEnv().env['SERVER_IP']}/api/users/revoke_token",
          body: {"id": id});
      return none();
    }

    // Generate new access token
    http.Response res;
    try {
      res = await http.post(
          "${DotEnv().env['SERVER_IP']}/api/users/refresh_token",
          body: {"refreshToken": token});
    } on SocketException {
      return none();
    }

    if (res.statusCode == 200) {
      // Store the new refresh token and return the access token
      final json = jsonDecode(res.body);
      final accessToken = json['accessToken'];
      final refreshToken = json['refreshToken'];
      _storageClient.storeRefreshToken(refreshToken as String);
      return some(JWT(token: accessToken as String));
    }
    return none();
  }

  // Log out the user
  @override
  Future<void> logout() async {
    await _storageClient.deleteRefreshToken();
  }
}
