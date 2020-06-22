
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/login_failure.dart';
import 'package:foodprint/domain/auth/register_failure.dart';
import 'package:foodprint/domain/auth/user.dart';
import 'package:foodprint/domain/auth/value_objects.dart';

// Basically a repository - defines the methods that need to be implemented
abstract class IAuthFacade {
  
  // option = non-nullable type
  Future<Option<User>> getSignedInUser();

  // unit = void
  Future<Either<RegisterFailure, Unit>> register({
    @required EmailAddress emailAddress,
    @required Username username,
    @required Password password,
  });

  Future<Either<LoginFailure, Unit>> login({
    @required Username username,
    @required Password password,
  });
  Future<void> logout();
}