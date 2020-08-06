import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/restaurants/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_entity.freezed.dart';

/// An interface representing a restaurant that the user has visited.
@freezed
abstract class RestaurantEntity implements _$RestaurantEntity {
  const RestaurantEntity._();

  const factory RestaurantEntity({
    @required RestaurantID id,
    @required RestaurantName name,
    @required RestaurantRating rating,
    @required Latitude latitude,
    @required Longitude longitude,
    @required RestaurantTypes types,
  }) = _RestaurantEntity;
}
