import 'package:foodprint/domain/core/failures.dart';

/// Errors, unlike exceptions, cause the app to crash
class UnexpectedValueError extends Error {
  final ValueFailure valueFailure;

  UnexpectedValueError(this.valueFailure);

  @override
  String toString() {
    const explanation =
        'Encountered a ValueFailure error at an unrecoverable point. Terminating.';
    return Error.safeToString('$explanation Failure was $valueFailure.');
  }
}
