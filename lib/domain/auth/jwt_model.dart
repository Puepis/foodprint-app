import 'dart:convert' show json, ascii, base64;
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/core/value_validators.dart';

/// This is the JWT object that will be used throughout the app's UI layer.
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

  static Map<String, dynamic> getDecodedPayload(String token) {
    return json.decode(ascii.decode(
            base64.decode(base64.normalize(token.split(".")[1].toString()))))
        as Map<String, dynamic>;
  }
}
