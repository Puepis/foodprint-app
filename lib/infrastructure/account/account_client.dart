import 'dart:async';
import 'dart:core';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodprint/domain/account/account_failure.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/account/i_account_repository.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:injectable/injectable.dart';
import 'package:http/http.dart' as http;

/// Communicates with the foodprint-backend to perform account-related actions.
@LazySingleton(as: IAccountRepository)
class AccountClient implements IAccountRepository {
  @override
  Future<Either<AccountFailure, JWT>> changeAvatar(
      {@required JWT accessToken,
      @required PhotoData data,
      @required String fileName}) async {
    http.Response res;
    try {
      res = await http.post("${DotEnv().env['SERVER_IP']}/api/users/avatar",
          body: {
            "avatar_data": data.getOrCrash().toString(),
            "file_name": fileName
          },
          headers: {
            "authorization": "Bearer: ${accessToken.getOrCrash()}"
          });
    } on SocketException {
      return left(const AccountFailure.noInternet());
    }

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
      {@required JWT accessToken,
      @required Password oldPassword,
      @required Password newPassword}) async {
    http.Response res;
    try {
      res = await http.post(
          "${DotEnv().env['SERVER_IP']}/api/users/change/password",
          body: {
            "old_password": oldPassword.getOrCrash(),
            "new_password": newPassword.getOrCrash()
          },
          headers: {
            "authorization": "Bearer: ${accessToken.getOrCrash()}"
          });
    } on SocketException {
      return left(const AccountFailure.noInternet());
    }

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
      {@required JWT accessToken, @required Username newUsername}) async {
    http.Response res;
    try {
      res = await http.post(
          "${DotEnv().env['SERVER_IP']}/api/users/change/username",
          body: {"new_username": newUsername.getOrCrash()},
          headers: {"authorization": "Bearer: ${accessToken.getOrCrash()}"});
    } on SocketException {
      return left(const AccountFailure.noInternet());
    }

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
      {@required JWT accessToken}) async {
    http.Response res;
    try {
      res = await http.delete("${DotEnv().env['SERVER_IP']}/api/users/delete",
          headers: {"authorization": "Bearer: ${accessToken.getOrCrash()}"});
    } on SocketException {
      return left(const AccountFailure.noInternet());
    }

    if (res.statusCode == 200) {
      return right(unit);
    } else {
      return left(const AccountFailure.serverError());
    }
  }
}
