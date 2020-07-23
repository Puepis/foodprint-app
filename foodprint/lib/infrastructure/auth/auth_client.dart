import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodprint/domain/auth/i_auth_repository.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/auth/login_failure.dart';
import 'package:foodprint/domain/auth/register_failure.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/core/exceptions.dart';
import 'package:foodprint/infrastructure/core/tokens.dart';
import 'package:foodprint/infrastructure/local_storage/local_storage_client.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

// Implements the interface authentication methods (communicates with the outside world)
@LazySingleton(as: IAuthRepository)
class AuthClient implements IAuthRepository {
  final JWTStorageClient _storageClient =
      JWTStorageClient(storage: const FlutterSecureStorage());

  @override
  Future<Either<RegisterFailure, Unit>> register(
      {@required Username username, @required Password password}) async {
    final usernameStr = username.getOrCrash();
    final passwordStr = password.getOrCrash();

    final res = await http.post("$serverIP/api/users/register",
        body: {"username": usernameStr, "password": passwordStr});

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
    final res = await http.post("$serverIP/api/users/login",
        body: {"username": usernameStr, "password": passwordStr});

    if (res.statusCode == 200) {
      final JWT jwt = JWT(token: res.body);

      if (jwt.isValid()) {
        // Store token
        await _storageClient.storeUserToken(jwt);
        return right(jwt);
      } else {
        return left(const LoginFailure.serverError());
      }
    } else if (res.statusCode == 401) {
      return left(const LoginFailure.invalidLoginCombination());
    } else {
      return left(const LoginFailure.serverError());
    }
  }

  @override
  Future<Option<JWT>> getUserToken() async {
    try {
      final JWT jwt = await _storageClient.getUserToken(); // try to fetch token

      // Check if token expired
      final String token = jwt.getOrCrash();
      final Map<String, dynamic> payload = JWT.getDecodedPayload(token);

      final DateTime expiry =
          DateTime.fromMillisecondsSinceEpoch((payload["exp"] as int) * 1000);

      if (expiry.isAfter(DateTime.now())) {
        // hasn't expired
        return some(jwt);
      }

      // If token expired, delete and return none()
      await _storageClient.deleteUserToken();
      return none();
    } on TokenNotFoundException {
      return none();
    }
  }

  // Log out the user
  @override
  Future<void> logout() async {
    await _storageClient.deleteUserToken();
  }

  @override
  Future<void> replaceToken({@required JWT newToken}) async {
    await _storageClient.storeUserToken(newToken);
  }
}
