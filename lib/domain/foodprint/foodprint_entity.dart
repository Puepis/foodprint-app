import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'foodprint_entity.freezed.dart';

/// The interface representing the user's foodprint.
@freezed
abstract class FoodprintEntity implements _$FoodprintEntity {
  const FoodprintEntity._();

  const factory FoodprintEntity(
          {@required
              Map<RestaurantEntity, List<PhotoEntity>> restaurantPhotos}) =
      _FoodprintEntity;
}
