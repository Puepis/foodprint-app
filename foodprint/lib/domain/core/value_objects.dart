import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/core/errors.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:uuid/uuid.dart';

// Generic value class 
@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity 
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  bool isValid() => value.isRight();

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;
    return o is ValueObject<T> && o.value == value;
  }

  @override
  int get hashCode => value.hashCode;

  @override
  String toString() => 'Value($value)';
}

// Can be used for anything, not just user
class UniqueId extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  // Generate new id
  factory UniqueId() {
    return UniqueId._(
      right(Uuid().v1()),
    );
  }

  // If id is already provided
  factory UniqueId.fromUniqueString(String uniqueId) {
    assert(uniqueId != null);
    return UniqueId._(
      right(uniqueId),
    );
  }

  const UniqueId._(this.value);
}