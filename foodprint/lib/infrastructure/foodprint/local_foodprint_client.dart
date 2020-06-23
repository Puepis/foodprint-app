

import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/foodprint/i_local_foodprint_repository.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';


class LocalFoodprintClient implements ILocalFoodprintRepository {

  @override
  FoodprintEntity addPhotoToFoodprint({
    @required PhotoEntity newPhoto,
    @required RestaurantEntity restaurant,
    @required FoodprintEntity oldFoodprint
  }) {
    
    final restaurantPhotos = oldFoodprint.restaurantPhotos;
    if (restaurantPhotos.containsKey(restaurant)) {
      restaurantPhotos[restaurant].insert(0, newPhoto);
    }
    else {
      restaurantPhotos[restaurant] = [newPhoto];
    }
    return FoodprintEntity(restaurantPhotos: restaurantPhotos);
  }

  @override
  FoodprintEntity removePhotoFromFoodprint({
    @required PhotoEntity photo,
    @required RestaurantEntity restaurant,
    @required FoodprintEntity oldFoodprint
  }) {
    dynamic removeKey;
    final restaurantPhotos = oldFoodprint.restaurantPhotos; 
    restaurantPhotos.forEach((key, value) {
      if (key == restaurant) {
        value.removeWhere((e) => e.storagePath.getOrCrash().compareTo(photo.storagePath.getOrCrash()) == 0);
        if (value.isEmpty) {
          removeKey = key;
        }
      }
    });
    if (removeKey != null) {
      restaurantPhotos.remove(removeKey);
    }
    return FoodprintEntity(restaurantPhotos: restaurantPhotos);
  }

  @override
  FoodprintEntity editPhotoInFoodprint({
    @required PhotoEntity photo,
    @required RestaurantEntity restaurant,
    @required FoodprintEntity oldFoodprint
  }) {
    final restaurantPhotos = oldFoodprint.restaurantPhotos;
    restaurantPhotos.forEach((key, photos) {
      if (key == restaurant) {
        for (final p in photos) {
          if (p.storagePath.getOrCrash().compareTo(photo.storagePath.getOrCrash()) == 0) {
            final index = photos.indexOf(p);
            photos[index] = photo;
          }
        }
      }
    });
    return FoodprintEntity(restaurantPhotos: restaurantPhotos);
  }


  List<PhotoEntity> getPhotosFromFoodprint(FoodprintEntity foodprint) {
    final restaurantPhotos = foodprint.restaurantPhotos;
    final List<PhotoEntity> result = [];
    for (final photos in restaurantPhotos.values) {
      result.addAll(photos);
    }
    return result;
  }
}


