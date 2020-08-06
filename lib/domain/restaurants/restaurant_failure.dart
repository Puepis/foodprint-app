import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_failure.freezed.dart';

/// Represents all failures that could result from restaurant search.
@freezed
abstract class RestaurantFailure with _$RestaurantFailure {
  const factory RestaurantFailure.unexpectedSearchFailure() =
      _UnexpectedSearchFailure;
  const factory RestaurantFailure.requestDenied() = _RequestDenied;
  const factory RestaurantFailure.overQueryLimit() = _OverQueryLimit;
  const factory RestaurantFailure.invalidRequest() = _InvalidRequest;
  const factory RestaurantFailure.notFound() = _NotFound;
  const factory RestaurantFailure.noInternet() = _NoInternet;
}
