import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/core/errors.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/core/value_validators.dart';
import 'package:uuid/uuid.dart';

/// Interface representing an object that contains a validated value.
@immutable
abstract class ValueObject<T> {
  const ValueObject();
  Either<ValueFailure<T>, T> get value;

  /// Throws [UnexpectedValueError] containing the [ValueFailure]
  T getOrCrash() {
    // id = identity
    return value.fold((f) => throw UnexpectedValueError(f), id);
  }

  Either<ValueFailure<dynamic>, Unit> get failureOrNone {
    // discard the correct value
    return value.fold((l) => left(l), (r) => right(unit));
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

// Unique string ID
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

class Timestamp extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory Timestamp(String timestamp) {
    assert(timestamp != null);
    return Timestamp._(
      validateStringNotEmpty(timestamp),
    );
  }

  const Timestamp._(this.value);
}

class Latitude extends ValueObject<double> {
  static const double min = -90.0;
  static const double max = 90.0;
  @override
  final Either<ValueFailure<double>, double> value;

  factory Latitude(double lat) {
    assert(lat != null);
    return Latitude._(
      validateDoubleInRange(lat, min, max),
    );
  }

  const Latitude._(this.value);
}

class Longitude extends ValueObject<double> {
  static const double min = -180.0;
  static const double max = 180.0;
  @override
  final Either<ValueFailure<double>, double> value;

  factory Longitude(double lng) {
    assert(lng != null);
    return Longitude._(
      validateDoubleInRange(lng, min, max),
    );
  }

  const Longitude._(this.value);
}
