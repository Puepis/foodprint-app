

import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/auth/i_auth_facade.dart';
import 'package:foodprint/domain/auth/login_failure.dart';
import 'package:foodprint/domain/auth/register_failure.dart';
import 'package:foodprint/domain/auth/user.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/infrastructure/core/tokens.dart';
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
  Future<Either<LoginFailure, Unit>> login({
    @required Username username,
    @required Password password
  }) async {
    final usernameStr = username.getOrCrash();
    final passwordStr = password.getOrCrash(); 
    final res = await http.post(
      "$serverIP/api/users/login", // TODO: Cache the token
      body: {
        "username": usernameStr,
        "password": passwordStr
      }
    );
    if (res.statusCode == 200) {
      return right(unit);
    } else if (res.statusCode == 401) {
      return left(const LoginFailure.invalidLoginCombination());
    } else {
      return left(const LoginFailure.serverError());
    }
  }

  @override
  Future<Option<User>> getSignedInUser() {
    // TODO: implement getSignedInUser
    throw UnimplementedError();
  }

  @override
  Future<void> logout() => throw UnimplementedError(); 
}