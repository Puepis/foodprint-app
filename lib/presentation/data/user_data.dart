import 'package:flutter/material.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

class UserData extends ChangeNotifier {
  final FoodprintEntity foodprint;
  JWT token;
  UserData({this.foodprint, this.token});

  dynamic getKey(RestaurantEntity restaurant) {
    for (final key in foodprint.restaurantPhotos.keys) {
      if (key.id.getOrCrash() == restaurant.id.getOrCrash()) {
        return key;
      }
    }
    return null;
  }

  void updatePhoto(RestaurantEntity restaurant, PhotoEntity newPhoto) {
    final key = getKey(restaurant);
    final photos = foodprint.restaurantPhotos[key];
    final index = photos.indexWhere(
        (e) => e.storagePath.getOrCrash() == newPhoto.storagePath.getOrCrash());
    photos[index] = newPhoto;
    notifyListeners();
  }

  void deletePhoto(RestaurantEntity restaurant, PhotoEntity photo) {
    final key = getKey(restaurant);
    final photos = foodprint.restaurantPhotos[key];
    photos.removeWhere((element) =>
        element.storagePath.getOrCrash() == photo.storagePath.getOrCrash());
    if (photos.isEmpty) foodprint.restaurantPhotos.remove(key);
    notifyListeners();
  }

  void addPhoto(RestaurantEntity restaurant, PhotoEntity photo) {
    final key = getKey(restaurant);
    // Restaurant already visited
    if (key != null) {
      foodprint.restaurantPhotos[key].add(photo);
    } else {
      foodprint.restaurantPhotos[restaurant] = [photo];
    }
    notifyListeners();
  }

  void updateToken(JWT newToken) {
    token = newToken;
    notifyListeners();
  }
}
