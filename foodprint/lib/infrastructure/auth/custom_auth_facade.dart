

import 'package:flutter/foundation.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/auth/i_auth_facade.dart';
import 'package:foodprint/domain/auth/login_failure.dart';
import 'package:foodprint/domain/auth/register_failure.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:injectable/injectable.dart';

// Implements the interface authentication methods (communicates with the outside world)
@lazySingleton
@Injectable(as: IAuthFacade)
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
    try {
      // Call api to authenticate  
      return right(unit);
    } catch (e) {
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
    try {
      // Call api to authenticate  
      return right(unit);
    } catch (e) {
      return left(const LoginFailure.serverError());
    }
  }
}