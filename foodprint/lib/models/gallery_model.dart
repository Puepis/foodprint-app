
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:foodprint/models/foodprint_photo.dart';

class GalleryModel extends ChangeNotifier {
  List<FoodprintPhoto> _photos;

  GalleryModel(List<FoodprintPhoto> photos) {
    _photos = photos;
  }

  List<FoodprintPhoto> get photos => _photos;

  void addPhoto(FoodprintPhoto photo) {
    _photos.insert(0, photo); // add to front of list
    notifyListeners(); // Rebuild gallery
  }

  // TODO: Photo edit/deletion feature
  // Delete all photos
  void removeAll() {
    _photos.clear();
    notifyListeners();
  }

}