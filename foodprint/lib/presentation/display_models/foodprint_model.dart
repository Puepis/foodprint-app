import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

/// Contains general methods that pertain to the user's foodprint
class FoodprintModel {
  final FoodprintEntity foodprint;
  FoodprintModel(this.foodprint);

  List<RestaurantEntity> get restaurants =>
      foodprint.restaurantPhotos.keys.toList();

  List<PhotoEntity> get photos {
    final List<PhotoEntity> result = [];
    for (final restaurant in restaurants) {
      result.addAll(foodprint.restaurantPhotos[restaurant]);
    }
    return result;
  }
}
