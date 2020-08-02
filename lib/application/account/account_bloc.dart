import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/account/account_failure.dart';
import 'package:foodprint/domain/account/i_account_repository.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

part 'account_event.dart';
part 'account_state.dart';

/// BLoC responsible for the business logic behind the user's account actions.
///
/// Maps incoming [AccountEvent] to [AccountState]
@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final IAccountRepository _accountClient;
  AccountBloc(this._accountClient) : super(AccountInitial());

  @override
  Stream<AccountState> mapEventToState(
    AccountEvent event,
  ) async* {
    yield AccountActionLoading();
    if (event is AvatarChanged) {
      yield* _mapAvatarChangedToState(event.token, event.newAvatarFile);
    }
    if (event is AccountUsernameChanged) {
      yield* _mapUsernameChangedToState(event.token, event.newUsername);
    }
    if (event is AccountPasswordChanged) {
      yield* _mapPasswordChangedToState(
          event.token, event.oldPassword, event.newPassword);
    }
    if (event is AccountDeleted) {
      yield* _mapAccountDeletedToState(event.token);
    }
  }

  Stream<AccountState> _mapAvatarChangedToState(
      JWT token, File newAvatarFile) async* {
    // Get image data from file
    final List<int> data = (await newAvatarFile.readAsBytes()).toList();
    final PhotoData photoData = PhotoData(data);

    // Get user id
    final id = UserID(
        int.parse(JWT.getDecodedPayload(token.getOrCrash())['sub'].toString()));

    final String fileName = basename(newAvatarFile.path);

    // Change avatar
    final Either<AccountFailure, JWT> result = await _accountClient
        .changeAvatar(id: id, data: photoData, fileName: fileName);

    yield result.fold((l) => AvatarChangeError(failure: l),
        (r) => AvatarChangeSuccess(token: r));
  }

  Stream<AccountState> _mapUsernameChangedToState(
      JWT token, String newUsername) async* {
    final Username username = Username(newUsername);

    // Parse id
    final id = UserID(
        int.parse(JWT.getDecodedPayload(token.getOrCrash())['sub'].toString()));
    final Either<AccountFailure, JWT> result =
        await _accountClient.changeUsername(id: id, newUsername: username);
    yield result.fold((l) => UsernameChangeError(failure: l),
        (r) => UsernameChangeSuccess(token: r));
  }

  Stream<AccountState> _mapPasswordChangedToState(
      JWT token, String oldPassword, String newPassword) async* {
    final Password password = Password(newPassword);
    final Password previousPassword = Password(oldPassword);

    // Parse id
    final id = UserID(
        int.parse(JWT.getDecodedPayload(token.getOrCrash())['sub'].toString()));
    final Either<AccountFailure, Unit> result =
        await _accountClient.changePassword(
            id: id, oldPassword: previousPassword, newPassword: password);
    yield result.fold(
        (l) => PasswordChangeError(failure: l), (r) => PasswordChangeSuccess());
  }

  Stream<AccountState> _mapAccountDeletedToState(JWT token) async* {
    final id = UserID(
        int.parse(JWT.getDecodedPayload(token.getOrCrash())['sub'].toString()));
    final Either<AccountFailure, Unit> result =
        await _accountClient.deleteAccount(id: id);
    yield result.fold(
        (l) => DeleteAccountError(failure: l), (r) => DeleteAccountSuccess());
  }
}
