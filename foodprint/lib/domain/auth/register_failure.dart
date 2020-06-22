
import 'package:freezed_annotation/freezed_annotation.dart';

part 'register_failure.freezed.dart'; // flutter pub run build_runner watch

@freezed
abstract class RegisterFailure with _$RegisterFailure {
  // "catch all" failure
  const factory RegisterFailure.serverError() = ServerError;
  const factory RegisterFailure.emailAlreadyInUse() = EmailAlreadyInUse;
  const factory RegisterFailure.usernameAlreadyInUse() = UsernameAlreadyInUse;
  const factory RegisterFailure.invalidRegisterCombination() = InvalidRegisterCombination;
}