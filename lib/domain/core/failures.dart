import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'failures.freezed.dart';

// ValueFailure union - group all failures from validated value objects
@freezed
abstract class ValueFailure<T> with _$ValueFailure<T> {
  const factory ValueFailure.exceedingLength({
    @required T failedValue,
    @required int max,
  }) = ExceedingLength<T>;
  const factory ValueFailure.empty({
    @required T failedValue,
  }) = Empty<T>;
  const factory ValueFailure.invalidEmail({
    @required T failedValue,
  }) = InvalidEmail<T>;
  const factory ValueFailure.passwordTooShort({
    @required T failedValue,
  }) = PasswordTooShort<T>;
  const factory ValueFailure.passwordTooLong({
    @required T failedValue,
  }) = PasswordTooLong<T>;
  const factory ValueFailure.outofBounds({
    @required T failedValue,
  }) = OutOfBounds<T>;
  const factory ValueFailure.invalidToken({
    @required T failedValue,
  }) = InvalidToken<T>;
}
