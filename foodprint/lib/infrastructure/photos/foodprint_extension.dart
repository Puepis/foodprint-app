

extension FoodprintExtension on Map<Restaurant, List<FoodprintPhoto>> {

  Map<Restaurant, List<FoodprintPhoto>> addPhoto(FoodprintPhoto photo, Restaurant res) {
    final foodprint = this;
    final rv = foodprint.getVisitedRestaurantFromId(photo.restaurantId);
    if (rv == null) { // generate new key
      this[res] = [photo];
    }
    else {
      foodprint[rv].insert(0, photo);
    }
    return foodprint;
  }

  Map<Restaurant, List<FoodprintPhoto>> removePhoto(FoodprintPhoto photo) {
    dynamic removeKey;
    final foodprint = this;
    foodprint.forEach((key, value) {
      if (key.id.compareTo(photo.restaurantId) == 0) {
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

  Map<Restaurant, List<FoodprintPhoto>> editPhoto(FoodprintPhoto newPhoto) {
    final foodprint = this;
    foodprint.forEach((key, photos) {
      if (key.id.compareTo(newPhoto.restaurantId) == 0) {
        for (final p in photos) {
          if (p.storagePath.compareTo(newPhoto.storagePath) == 0) {
            final index = photos.indexOf(p);
            photos[index] = newPhoto;
          }
        }
      }
    });
    return foodprint;
  }

  Restaurant getVisitedRestaurantFromId(String id) {
    final foodprint = this;
    for (final restaurant in foodprint.keys) {
      if (id.compareTo(restaurant.id) == 0) { // compare restaurant ids
        return restaurant;
      }
    }
    return null;
  }

  List<FoodprintPhoto> get photos {
    final List<FoodprintPhoto> result = [];
    final foodprint = this;
    for (final photos in foodprint.values) {
      result.addAll(photos);
    }
    return result;
  }
}


