
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:foodprint/models/foodprint_photo.dart';

class GalleryModel extends ChangeNotifier {
  // Internal, private state of photos - stores a list of files
  List<FoodprintPhoto> _photos;

  GalleryModel(List<FoodprintPhoto> photos) {
    _photos = photos;
  }

  List<FoodprintPhoto> get photos => _photos;

  void addPhotoDir(FoodprintPhoto photo) {
    _photos.add(photo); // add to end of list
    notifyListeners(); // Rebuild gallery
  }

  // TODO: Photo edit/deletion feature
  // Delete all photos
  void removeAll() {
    _photos.clear();
    notifyListeners();
  }

}