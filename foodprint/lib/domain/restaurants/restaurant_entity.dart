
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/restaurants/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'restaurant_entity.freezed.dart';

@freezed
abstract class RestaurantEntity implements _$RestaurantEntity {
  const RestaurantEntity._();

  const factory RestaurantEntity({
    @required RestaurantID restaurantID,
    @required RestaurantName restaurantName,
    @required RestaurantRating restaurantRating,
    @required Latitude latitude,
    @required Longitude longitude

  }) = _RestaurantEntity;

}