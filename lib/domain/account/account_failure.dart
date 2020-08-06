import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_failure.freezed.dart';

/// The interface representing the possible failures that could occur when a
/// user tries to perform an account action (e.g. changing username).
@freezed
abstract class AccountFailure with _$AccountFailure {
  const factory AccountFailure.wrongPassword() = _WrongPassword;
  const factory AccountFailure.usernameTaken() = _UsernameTaken;
  const factory AccountFailure.serverError() = _ServerError;
  const factory AccountFailure.noInternet() = _NoInternet;
}
