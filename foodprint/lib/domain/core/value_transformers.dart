
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

List<Tuple2<PhotoEntity, RestaurantEntity>> getPhotosFromFoodprint(FoodprintEntity foodprint) {
    final restaurantPhotos = foodprint.restaurantPhotos;
    final List<Tuple2<PhotoEntity, RestaurantEntity>> result = []; 
    restaurantPhotos.forEach((restaurant, photos) {
      for (final photo in photos) {
        result.add(Tuple2(photo, restaurant));
      }
    });
    return result;
}
