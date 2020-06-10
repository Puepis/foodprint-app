
import 'dart:io';
import 'package:flutter/foundation.dart';

class GalleryModel extends ChangeNotifier {
  // Internal, private state of photos - stores a list of files
  List<FileSystemEntity> _photoDirs;

  GalleryModel(List photoDirs) {
    _photoDirs = photoDirs;
  }

  List<FileSystemEntity> get photoDirs => _photoDirs;

  void addPhotoDir(Directory photoDir) {
    _photoDirs.add(photoDir); // add to end of list
    notifyListeners(); // Rebuild gallery
  }

  // Delete all photos
  void removeAll() {
    _photoDirs.clear();
    notifyListeners();
  }

}