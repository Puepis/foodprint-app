
import 'package:freezed_annotation/freezed_annotation.dart';

part 'login_failure.freezed.dart'; // flutter pub run build_runner watch

@freezed
abstract class LoginFailure with _$LoginFailure {
  // "catch all" failure
  const factory LoginFailure.serverError() = ServerError;
  const factory LoginFailure.invalidLoginCombination() =
  InvalidLoginCombination;
}