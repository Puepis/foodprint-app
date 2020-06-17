
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/photo_response.dart';
import 'package:foodprint/models/restaurant_model.dart';

class UserFoodprint {
  static Map<Restaurant, List<FoodprintPhoto>> addPhoto(FoodprintPhoto photo, Map foodprint) {
    var rv = _restaurantKey(photo.restaurant.id, foodprint);
    if (rv == null) { // generate new key
      Restaurant place = Restaurant(
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
    Map<Restaurant, List<FoodprintPhoto>> result = Map();
    response.photos.forEach((photo) {
      var rv = _restaurantKey(photo.restaurant.id, result);
      if (rv == null) { // generate new key
        Restaurant place = Restaurant(
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
    });
    return result;
  }

  static dynamic _restaurantKey(String id, Map foodprint) {
    for (Restaurant restaurant in foodprint.keys) {
      if (id.compareTo(restaurant.id) == 0) { // compare restaurant ids
        return restaurant;
      }
    }
    return null;
  }
}