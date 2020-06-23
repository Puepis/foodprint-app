

import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodprint/domain/auth/i_auth_facade.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/auth/login_failure.dart';
import 'package:foodprint/domain/auth/register_failure.dart';
import 'package:foodprint/domain/auth/user.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/core/exceptions.dart';
import 'package:foodprint/infrastructure/core/tokens.dart';
import 'package:foodprint/infrastructure/local_storage/local_storage_client.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

// Implements the interface authentication methods (communicates with the outside world)
@LazySingleton(as: IAuthFacade)
class CustomAuthFacade implements IAuthFacade {

  @override
  Future<Either<RegisterFailure, Unit>> register({
    @required EmailAddress emailAddress, 
    @required Username username,
    @required Password password
  }) async {
    final emailAddressStr = emailAddress.getOrCrash();
    final usernameStr = username.getOrCrash();
    final passwordStr = password.getOrCrash(); 
    final res = await http.post(
      "$serverIP/api/users/register",
      body: {
        "email": emailAddressStr,
        "username": usernameStr,
        "password": passwordStr
      }
    );
    if (res.statusCode == 200) {
      return right(unit);
    } else if (res.statusCode == 401) {
      return left(const RegisterFailure.invalidRegisterCombination());
    } else {
      return left(const RegisterFailure.serverError());
    }
  }

  @override
  Future<Either<LoginFailure, JWT>> login({
    @required Username username,
    @required Password password
  }) async {
    final usernameStr = username.getOrCrash();
    final passwordStr = password.getOrCrash(); 
    final res = await http.post(
      "$serverIP/api/users/login", 
      body: {
        "username": usernameStr,
        "password": passwordStr
      }
    );
    if (res.statusCode == 200) {
       
      final JWT jwt = JWT(token: res.body); // token should be valid but check in case of tampering
      if (jwt.isValid()) {

        // Store token 
        final localDataClient = JWTStorageClient(storage: const FlutterSecureStorage());
        await localDataClient.storeUserToken(jwt);
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
    final localDataClient = JWTStorageClient(storage: const FlutterSecureStorage()); 
    try {
      final jwt = await localDataClient.getUserToken(); // try to fetch the jwt
      return some(jwt);
    } on TokenException {
      return none();
    } 
  }

  @override
  Future<void> logout({@required User user}) async {

    final localDataClient = JWTStorageClient(storage: const FlutterSecureStorage()); 
    final username = user.username.getOrCrash();

    await http.post(
        "$serverIP/api/users/logout",
        body: {
          "username": username
        }
    );
    await localDataClient.deleteUserToken(); 
  }
}