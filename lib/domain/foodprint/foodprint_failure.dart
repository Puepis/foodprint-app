import 'package:freezed_annotation/freezed_annotation.dart';

part 'foodprint_failure.freezed.dart';

/// Represents all possible failures that could occur when fetching the user's
/// foodprint.
@freezed
abstract class FoodprintFailure with _$FoodprintFailure {
  const factory FoodprintFailure.unauthorizedToken() = _UnauthorizedToken;
  const factory FoodprintFailure.serverError() = _ServerError;
  const factory FoodprintFailure.noInternet() = _NoInternet;
}
