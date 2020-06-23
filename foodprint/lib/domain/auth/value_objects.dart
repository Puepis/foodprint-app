
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/core/value_validators.dart';

// Validated Value Object
// - don't want a simple String to represent each field, so we use VVOs
@immutable
class EmailAddress extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory EmailAddress(String email) {
    assert(email != null);
    return EmailAddress._(
      validateEmailAddress(email),
    );
  }

  // Private constructor
  const EmailAddress._(this.value) : assert(value != null);
}

@immutable
class Username extends ValueObject<String> {
  static const maxLength = 20;
  @override
  final Either<ValueFailure<String>, String> value;

  factory Username(String username) {
    assert(username != null);
    return Username._(
      validateMaxStringLength(username, maxLength),
    );
  }

  // Private constructor
  const Username._(this.value) : assert(value != null);
}

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








