import 'dart:async';
import 'dart:core';

import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/account/account_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/account/i_account_repository.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/infrastructure/core/tokens.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

@LazySingleton(as: IAccountRepository)
class AccountClient implements IAccountRepository {
  /// Makes a request to the server to change the avatar and handles the reponse
  @override
  Future<Either<AccountFailure, JWT>> changeAvatar(
      {@required UserID id,
      @required PhotoData data,
      @required String fileName}) async {
    final res = await http.post("$serverIP/api/users/avatar", body: {
      "id": id.getOrCrash().toString(),
      "avatar_data": data.getOrCrash().toString(),
      "file_name": fileName
    });

    if (res.statusCode == 200) {
      final JWT token = JWT(token: res.body);
      if (token.isValid()) {
        return right(token);
      }
      return left(const AccountFailure.serverError());
    } else {
      return left(const AccountFailure.serverError());
    }
  }

  @override
  Future<Either<AccountFailure, Unit>> changePassword(
      {@required UserID id,
      @required Password oldPassword,
      @required Password newPassword}) async {
    final res = await http.post(
      "$serverIP/api/users/change/password",
      body: {
        "id": id.getOrCrash().toString(),
        "old_password": oldPassword.getOrCrash(),
        "new_password": newPassword.getOrCrash()
      },
    );

    if (res.statusCode == 200) {
      return right(unit);
    } else if (res.statusCode == 402) {
      return left(const AccountFailure.wrongPassword());
    } else {
      return left(const AccountFailure.serverError());
    }
  }

  @override
  Future<Either<AccountFailure, JWT>> changeUsername(
      {@required UserID id, @required Username newUsername}) async {
    final res = await http.post(
      "$serverIP/api/users/change/username",
      body: {
        "id": id.getOrCrash().toString(),
        "new_username": newUsername.getOrCrash()
      },
    );

    if (res.statusCode == 200) {
      final JWT token = JWT(token: res.body);
      return right(token);
    } else if (res.statusCode == 402) {
      return left(const AccountFailure.usernameTaken());
    } else {
      return left(const AccountFailure.serverError());
    }
  }

  @override
  Future<Either<AccountFailure, Unit>> deleteAccount(
      {@required UserID id}) async {
    final res = await http.delete(
      "$serverIP/api/users/delete",
      headers: {
        "id": id.getOrCrash().toString(),
      },
    );

    if (res.statusCode == 200) {
      return right(unit);
    } else {
      return left(const AccountFailure.serverError());
    }
  }
}
