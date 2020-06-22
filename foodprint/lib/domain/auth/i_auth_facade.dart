
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/login_failure.dart';
import 'package:foodprint/domain/auth/register_failure.dart';
import 'package:foodprint/domain/auth/value_objects.dart';

// Interface combines different auth methods into a Facade
abstract class IAuthFacade {
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
}