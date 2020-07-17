import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/foodprint/i_local_foodprint_repository.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:injectable/injectable.dart';

@injectable
class LocalFoodprintClient implements ILocalFoodprintRepository {
  Map<RestaurantEntity, List<PhotoEntity>> _insertPhoto(
      Map<RestaurantEntity, List<PhotoEntity>> restaurantPhotos,
      RestaurantEntity restaurant,
      PhotoEntity newPhoto) {
    bool _keyExists = false;
    for (final key in restaurantPhotos.keys) {
      // Key already exists
      if (key.restaurantID.getOrCrash() == restaurant.restaurantID.getOrCrash()) {
        _keyExists = true;
        restaurantPhotos[key].insert(0, newPhoto);
      }
    }
    if (!_keyExists) {
      restaurantPhotos[restaurant] = [newPhoto];
    }
    return restaurantPhotos;
  }

  /// Add a new photo to the foodprint stored in local state
  @override
  FoodprintEntity addPhotoToFoodprint(
      {@required PhotoEntity newPhoto,
      @required RestaurantEntity restaurant,
      @required FoodprintEntity oldFoodprint}) {
    final restaurantPhotos =
        _insertPhoto(oldFoodprint.restaurantPhotos, restaurant, newPhoto);
    return FoodprintEntity(restaurantPhotos: restaurantPhotos);
  }

  @override
  FoodprintEntity removePhotoFromFoodprint(
      {@required PhotoEntity photo,
      @required RestaurantEntity restaurant,
      @required FoodprintEntity oldFoodprint}) {
    dynamic removeKey;
    final restaurantPhotos = oldFoodprint.restaurantPhotos;
    restaurantPhotos.forEach((key, photos) {
      if (key.restaurantID.getOrCrash() == restaurant.restaurantID.getOrCrash()) {
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

  @override
  FoodprintEntity editPhotoInFoodprint(
      {@required PhotoEntity photo,
      @required RestaurantEntity restaurant,
      @required FoodprintEntity oldFoodprint}) {
    final restaurantPhotos = oldFoodprint.restaurantPhotos;
    restaurantPhotos.forEach((key, photos) {
      if (key.restaurantID.getOrCrash() == restaurant.restaurantID.getOrCrash()) {
        for (final p in photos) {
          if (p.storagePath
                  .getOrCrash()
                  .compareTo(photo.storagePath.getOrCrash()) ==
              0) {
            final index = photos.indexOf(p);
            photos[index] = photo;
          }
        }
      }
    });
    return FoodprintEntity(restaurantPhotos: restaurantPhotos);
  }
}
