import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/foodprint/i_local_foodprint_repository.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:injectable/injectable.dart';

/// Responsible for updating the local foodprint
@injectable
class LocalFoodprintClient implements ILocalFoodprintRepository {
  /// Add a new photo to the local foodprint
  @override
  FoodprintEntity addPhotoToFoodprint(
      {@required PhotoEntity newPhoto,
      @required RestaurantEntity restaurant,
      @required FoodprintEntity oldFoodprint}) {
    final restaurantPhotos = oldFoodprint.restaurantPhotos;
    bool _keyExists = false;

    // Check if key already exists
    for (final key in restaurantPhotos.keys) {
      if (key.restaurantID.getOrCrash() ==
          restaurant.restaurantID.getOrCrash()) {
        _keyExists = true;
        restaurantPhotos[key].insert(0, newPhoto);
      }
    }
    if (!_keyExists) {
      restaurantPhotos[restaurant] = [newPhoto];
    }

    return FoodprintEntity(restaurantPhotos: restaurantPhotos);
  }

  /// Removes a photo from the local foodprint
  @override
  FoodprintEntity removePhotoFromFoodprint(
      {@required PhotoEntity photo,
      @required RestaurantEntity restaurant,
      @required FoodprintEntity oldFoodprint}) {
    dynamic removeKey;
    final restaurantPhotos = oldFoodprint.restaurantPhotos;

    restaurantPhotos.forEach((key, photos) {
      // Match the restaurant
      if (key.restaurantID.getOrCrash() ==
          restaurant.restaurantID.getOrCrash()) {
        photos.removeWhere((e) =>
            e.storagePath.getOrCrash() == photo.storagePath.getOrCrash());
        if (photos.isEmpty) {
          removeKey = key;
        }
      }
    });
    if (removeKey != null) {
      restaurantPhotos.remove(removeKey);
    }
    return FoodprintEntity(restaurantPhotos: restaurantPhotos);
  }

  /// Update the local foodprint with the new [photo]
  @override
  FoodprintEntity editPhotoInFoodprint(
      {@required PhotoEntity photo,
      @required RestaurantEntity restaurant,
      @required FoodprintEntity oldFoodprint}) {
    final restaurantPhotos = oldFoodprint.restaurantPhotos;
    restaurantPhotos.forEach((key, photos) {

      // Match restaurant key
      if (key.restaurantID.getOrCrash() ==
          restaurant.restaurantID.getOrCrash()) {
        for (final p in photos) {
          if (p.storagePath.getOrCrash() == photo.storagePath.getOrCrash()) {
            final index = photos.indexOf(p);
            photos[index] = photo;
          }
        }
      }
    });
    return FoodprintEntity(restaurantPhotos: restaurantPhotos);
  }
}
