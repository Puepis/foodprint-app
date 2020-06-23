import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_failure.freezed.dart';

// Something went wrong in the infrastructure layer 
@freezed
abstract class RestaurantFailure with _$RestaurantFailure {
  const factory RestaurantFailure.unexpectedSearchFailure() = _UnexpectedSearchFailure;
  const factory RestaurantFailure.requestDenied() = _RequestDenied;
}