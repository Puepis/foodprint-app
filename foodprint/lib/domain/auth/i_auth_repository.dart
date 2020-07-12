
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/auth/login_failure.dart';
import 'package:foodprint/domain/auth/register_failure.dart';
import 'package:foodprint/domain/auth/value_objects.dart';

abstract class IAuthRepository {
  
  // Get the user's JWT
  Future<Option<JWT>> getUserToken();

  // unit = void
  Future<Either<RegisterFailure, Unit>> register({
    @required Username username,
    @required Password password,
  });

  // Either a failure or a JWT token
  Future<Either<LoginFailure, JWT>> login({
    @required Username username,
    @required Password password,
  });

  Future<void> logout({
    @required JWT token 
  });
}