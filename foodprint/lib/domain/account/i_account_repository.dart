import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/photos/value_objects.dart';

import 'account_failure.dart';

/// Interface class that defines the various user account actions
abstract class IAccountRepository {
  Future<Either<AccountFailure, JWT>> changeUsername({
    @required UserID id,
    @required Username newUsername,
  });

  Future<Either<AccountFailure, Unit>> changePassword({
    @required UserID id,
    @required Password oldPassword,
    @required Password newPassword,
  });

  Future<Either<AccountFailure, JWT>> changeAvatar({
    @required UserID id,
    @required PhotoData data,
    @required String fileName,
  });

  Future<Either<AccountFailure, Unit>> deleteAccount({
    @required UserID id,
  });
}
