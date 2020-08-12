import 'dart:convert' show json, ascii, base64;
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/core/errors.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/core/value_validators.dart';

/// Stores the user's access tokens.
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

  static Map<String, dynamic> getDecodedPayload(String token) =>
      json.decode(ascii.decode(
              base64.decode(base64.normalize(token.split(".")[1].toString()))))
          as Map<String, dynamic>;

  Map<String, dynamic> get payload {
    return value.fold(
        (l) => throw UnexpectedValueError(l),
        (r) => json.decode(ascii.decode(
                base64.decode(base64.normalize(r.split(".")[1].toString()))))
            as Map<String, dynamic>);
  }

  int get id => int.parse(payload['sub'].toString());
  String get username => payload['username'] as String;
  String get avatar_url => payload['avatar_url'] as String;
  bool get isExpired {
    final expiry =
        DateTime.fromMillisecondsSinceEpoch((payload['exp'] as int) * 1000);
    return expiry.isBefore(DateTime.now());
  }
}
