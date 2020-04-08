
import 'dart:io';
import 'package:flutter/foundation.dart';

class GalleryModel extends ChangeNotifier {
  // Internal, private state of photos - stores a list of files
  List<FileSystemEntity> _photoDirs;

  GalleryModel(List photoDirs) {
    _photoDirs = photoDirs;
  }

  List<FileSystemEntity> get photoDirs => _photoDirs;

  // Add a new photo to gallery
  void addPhotoDir(Directory photoDir) {
    _photoDirs.add(photoDir);
    notifyListeners(); // Rebuild gallery
  }

  // Delete all photos
  void removeAll() {
    _photoDirs.clear();
    notifyListeners();
  }

}