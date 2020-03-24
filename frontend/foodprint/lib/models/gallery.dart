
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:foodprint/gallery/gallery.dart';

class GalleryModel extends ChangeNotifier {
  // Internal, private state of photos - stores a list of files
  List<FileSystemEntity> _photos = [];

  GalleryModel(List images) {
    _photos = images;
  }

  List<FileSystemEntity> get photos => _photos;

  // Add a new photo to gallery
  void addPhoto(File newFile) {
    _photos.add(newFile);
    notifyListeners(); // Rebuild gallery
  }

  // Delete all photos
  void removeAll() {
    _photos.clear();
    notifyListeners();
  }

}