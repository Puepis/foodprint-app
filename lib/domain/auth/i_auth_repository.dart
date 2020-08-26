import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/auth/login_failure.dart';
import 'package:foodprint/domain/auth/register_failure.dart';
import 'package:foodprint/domain/auth/value_objects.dart';

abstract class IAuthRepository {
  /// Persist user login session or redirect to login page based on refresh
  /// token.
  Future<Option<JWT>> getAccessToken();

  Future<Either<RegisterFailure, Unit>> register({
    @required Username username,
    @required Password password,
  });

  /// Retrieves the user's JWT
  Future<Either<LoginFailure, JWT>> login({
    @required Username username,
    @required Password password,
  });

  Future<void> logout();
}
