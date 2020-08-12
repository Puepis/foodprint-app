import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/account/account_failure.dart';
import 'package:foodprint/domain/account/i_account_repository.dart';
import 'package:foodprint/domain/auth/i_auth_repository.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

part 'account_event.dart';
part 'account_state.dart';
part 'account_bloc.freezed.dart';

/// BLoC responsible for the business logic behind the user's account actions.
///
/// Maps incoming [AccountEvent] to [AccountState]
@injectable
class AccountBloc extends Bloc<AccountEvent, AccountState> {
  final IAccountRepository _accountClient;
  final IAuthRepository _authClient;
  AccountBloc(this._accountClient, this._authClient)
      : super(const AccountState.initial());

  @override
  Stream<AccountState> mapEventToState(
    AccountEvent event,
  ) async* {
    // Check if token has expired
    JWT accessToken;
    if (event.accessToken.isExpired) {
      final result = await _authClient.getAccessToken();
      accessToken = result.fold(() => null, (token) => token);
    }
    accessToken ??= event.accessToken;

    if (event is AvatarChanged) {
      yield const AvatarChangeLoading();
      yield* _mapAvatarChangedToState(accessToken, event.newAvatarFile);
    }
    if (event is AccountUsernameChanged) {
      yield const UsernameChangeLoading();
      yield* _mapUsernameChangedToState(accessToken, event.newUsername);
    }
    if (event is AccountPasswordChanged) {
      yield const PasswordChangeLoading();
      yield* _mapPasswordChangedToState(
          accessToken, event.oldPassword, event.newPassword);
    }
    if (event is AccountDeleted) {
      yield const DeleteAccountLoading();
      yield* _mapAccountDeletedToState(accessToken);
    }
  }

  Stream<AccountState> _mapAvatarChangedToState(
      JWT token, File newAvatarFile) async* {
    // Get image data from file
    final List<int> data = (await newAvatarFile.readAsBytes()).toList();
    final PhotoData photoData = PhotoData(data);

    final String fileName = basename(newAvatarFile.path);

    // Change avatar
    final Either<AccountFailure, JWT> result = await _accountClient
        .changeAvatar(accessToken: token, data: photoData, fileName: fileName);

    yield result.fold((l) => AvatarChangeError(failure: l),
        (r) => AvatarChangeSuccess(token: r));
  }

  Stream<AccountState> _mapUsernameChangedToState(
      JWT token, String newUsername) async* {
    final Username username = Username(newUsername);

    final Either<AccountFailure, JWT> result = await _accountClient
        .changeUsername(accessToken: token, newUsername: username);
    yield result.fold((l) => UsernameChangeError(failure: l),
        (r) => UsernameChangeSuccess(token: r));
  }

  Stream<AccountState> _mapPasswordChangedToState(
      JWT token, String oldPassword, String newPassword) async* {
    final Password password = Password(newPassword);
    final Password previousPassword = Password(oldPassword);

    final Either<AccountFailure, Unit> result =
        await _accountClient.changePassword(
            accessToken: token,
            oldPassword: previousPassword,
            newPassword: password);
    yield result.fold((l) => PasswordChangeError(failure: l),
        (r) => const PasswordChangeSuccess());
  }

  Stream<AccountState> _mapAccountDeletedToState(JWT token) async* {
    final Either<AccountFailure, Unit> result =
        await _accountClient.deleteAccount(accessToken: token);
    yield result.fold((l) => DeleteAccountError(failure: l),
        (r) => const DeleteAccountSuccess());
  }
}
