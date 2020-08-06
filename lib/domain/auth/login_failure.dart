import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_failure.freezed.dart';

/// Represents possible failures regarding user login.
@freezed
abstract class LoginFailure with _$LoginFailure {
  const factory LoginFailure.serverError() = ServerError;
  const factory LoginFailure.invalidLoginCombination() =
      InvalidLoginCombination;
}
