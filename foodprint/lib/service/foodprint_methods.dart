
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/photo_response.dart';
import 'package:foodprint/models/restaurant_model.dart';

class UserFoodprint {
  static Map<Restaurant, List<FoodprintPhoto>> addPhoto(FoodprintPhoto photo, Map<Restaurant, List<FoodprintPhoto>> foodprint) {
    final rv = _restaurantKey(photo.restaurant.id, foodprint);
    if (rv == null) { // generate new key
      final Restaurant place = Restaurant(
          id: photo.restaurant.id,
          name: photo.restaurant.name,
          rating: photo.restaurant.rating,
          latitude: photo.restaurant.latitude,
          longitude: photo.restaurant.longitude
      );
      foodprint[place] = [photo];
    }
    else {
      foodprint[rv].insert(0, photo);
    }
    return foodprint;
  }

  static Map<Restaurant, List<FoodprintPhoto>> fromResponse(PhotoResponse response) {
    final Map<Restaurant, List<FoodprintPhoto>> result = {};
    for (final photo in response.photos) {
      final rv = _restaurantKey(photo.restaurant.id, result);
      if (rv == null) { // generate new key
        final Restaurant place = Restaurant(
            id: photo.restaurant.id,
            name: photo.restaurant.name,
            rating: photo.restaurant.rating,
            latitude: photo.restaurant.latitude,
            longitude: photo.restaurant.longitude
        );
        result[place] = [photo];
      }
      else {
        result[rv].insert(0, photo);
      }
    }
    return result;
  }

  static dynamic _restaurantKey(String id, Map<Restaurant, List<FoodprintPhoto>> foodprint) {
    for (final restaurant in foodprint.keys) {
      if (id.compareTo(restaurant.id) == 0) { // compare restaurant ids
        return restaurant;
      }
    }
    return null;
  }

  static Map<Restaurant, List<FoodprintPhoto>> removePhoto(FoodprintPhoto photo,
      Map<Restaurant, List<FoodprintPhoto>> foodprint) {
    dynamic removeKey;
    foodprint.forEach((key, value) {
      if (key.id.compareTo(photo.restaurant.id) == 0) {
        value.removeWhere((element) => element.storagePath.compareTo(photo.storagePath) == 0);
        if (value.isEmpty) {
          removeKey = key;
        }
      }
    });
    if (removeKey != null) {
      foodprint.remove(removeKey);
    }
    return foodprint;
  }
}