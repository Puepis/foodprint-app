import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_failure.freezed.dart';

/// Represents possible failures regarding user registration.
@freezed
abstract class RegisterFailure with _$RegisterFailure {
  const factory RegisterFailure.serverError() = ServerError;
  const factory RegisterFailure.userAlreadyExists() = UserAlreadyExists;
  const factory RegisterFailure.invalidRegisterCombination() =
      InvalidRegisterCombination;
}
