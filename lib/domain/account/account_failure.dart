import 'package:freezed_annotation/freezed_annotation.dart';

part 'account_failure.freezed.dart';

@freezed
abstract class AccountFailure with _$AccountFailure {
  const factory AccountFailure.wrongPassword() = _WrongPassword;
  const factory AccountFailure.usernameTaken() = _UsernameTaken;
  const factory AccountFailure.serverError() = _ServerError;
}
