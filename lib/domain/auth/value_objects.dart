import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/core/value_validators.dart';

/// The [ValueObject] representing the username for user authentication.
@immutable
class Username extends ValueObject<String> {
  static const maxLength = 20;
  @override
  final Either<ValueFailure<String>, String> value;

  factory Username(String username) {
    assert(username != null);
    Either<ValueFailure<String>, String> result;
    final emptyOrNot = validateStringNotEmpty(username);

    // Username not empty
    if (emptyOrNot.isRight()) {
      result = validateMaxStringLength(username, maxLength);
    } else {
      result = emptyOrNot;
    }
    return Username._(result);
  }

  // Private constructor
  const Username._(this.value) : assert(value != null);
}

/// The [ValueObject] representing the password for user authentication.
@immutable
class Password extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Password(String password) {
    assert(password != null);
    return Password._(
      validatePassword(password),
    );
  }

  // Private constructor
  const Password._(this.value) : assert(value != null);
}

/// The [ValueObject] representing the confirmation password for user registration.
@immutable
class ConfirmationPassword extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory ConfirmationPassword(String confirmationPassword) {
    assert(confirmationPassword != null);
    return ConfirmationPassword._(right(confirmationPassword));
  }

  const ConfirmationPassword._(this.value) : assert(value != null);
}

/// The [ValueObject] representing the user id.
@immutable
class UserID extends ValueObject<int> {
  @override
  final Either<ValueFailure<int>, int> value;

  factory UserID(int id) {
    assert(id != null);
    return UserID._(
      right(id),
    );
  }

  const UserID._(this.value) : assert(value != null);
}
