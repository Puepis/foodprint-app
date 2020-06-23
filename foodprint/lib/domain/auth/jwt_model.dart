

import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/core/value_validators.dart';

// This is the JWT object that will be used in the app
@immutable
class JWT extends ValueObject<String> {
  @override
  final Either<ValueFailure<String>, String> value;

  factory JWT({@required String token}) {
    assert(token != null);
    return JWT._(
      validateJWT(token),
    );
  }

  const JWT._(this.value) : assert(value != null);
}