import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/core/failures.dart';

Either<ValueFailure<String>, String> validateEmailAddress(String input) {
  const emailRegex =
  r"""^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+""";
  if (RegExp(emailRegex).hasMatch(input)) {
    return right(input);
  } else {
    return left(ValueFailure.invalidEmail(failedValue: input)); // make illegal states unrepresentable
  }
}

Either<ValueFailure<String>, String> validateMaxStringLength(String input, int maxLength) {
  if (input.length <= maxLength) {
    return right(input);
  } else {
    return left(ValueFailure.exceedingLength(failedValue: input, max: maxLength)); // make illegal states unrepresentable
  }
}

Either<ValueFailure<String>, String> validatePassword(String input) {
  if (input.length >= 6) {
    return right(input);
  } else {
    return left(ValueFailure.shortPassword(failedValue: input)); // make illegal states unrepresentable
  }
}

Either<ValueFailure<String>, String> validateStringNotEmpty(String input) {
  if (input.isNotEmpty) {
    return right(input);
  } else {
    return left(ValueFailure.empty(failedValue: input));
  }
}

Either<ValueFailure<double>, double> validateDoubleInRange(double value, double min, double max) {
  if (value >= min && value <= max) {
    return right(value);
  } else {
    return left(ValueFailure.outofBounds(failedValue: value));
  }
}

Either<ValueFailure<int>, int> validateIntInRange(int value, int min, int max) {
  if (value >= min && value <= max) {
    return right(value);
  } else {
    return left(ValueFailure.outofBounds(failedValue: value));
  }
}