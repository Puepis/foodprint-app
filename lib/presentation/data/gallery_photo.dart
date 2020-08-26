import 'package:flutter/cupertino.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

class GalleryPhotoModel extends ChangeNotifier {
  PhotoEntity photo;
  RestaurantEntity restaurant;
  GalleryPhotoModel({this.photo, this.restaurant});

  void updatePhoto(PhotoEntity newPhoto) {
    photo = newPhoto;
    notifyListeners();
  }
}
