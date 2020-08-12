import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/photos/value_objects.dart';

import 'account_failure.dart';

/// Interface class that defines the various user account actions.
abstract class IAccountRepository {
  Future<Either<AccountFailure, JWT>> changeUsername({
    @required JWT accessToken,
    @required Username newUsername,
  });

  Future<Either<AccountFailure, Unit>> changePassword({
    @required JWT accessToken,
    @required Password oldPassword,
    @required Password newPassword,
  });

  Future<Either<AccountFailure, JWT>> changeAvatar({
    @required JWT accessToken,
    @required PhotoData data,
    @required String fileName,
  });

  Future<Either<AccountFailure, Unit>> deleteAccount({
    @required JWT accessToken,
  });
}
