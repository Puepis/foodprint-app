
import 'dart:io';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:path_provider/path_provider.dart';

// Contains methods for retrieving content and basic file methods
class PhotoManager {

  // Create new folder in AppDoc, returns the path
  Future<String> createFolder(String path, String folderName) async {
    final Directory _folder = new Directory('$path/$folderName/');

    // If folder exists, return path
    if (await _folder.exists()) {
      return _folder.path;
    } else { // Create new folder, then return
      final Directory _newFolder = await _folder.create(recursive: true);
      return _newFolder.path;
    }
  }

  static Future<String> getAppDocDir() async {
    return (await getApplicationDocumentsDirectory()).path;
  }

  static List<FileSystemEntity> getPhotoDirs(String path, String username) {
    List<FileSystemEntity> res = [];
    try {
      res = Directory('$path/$username/photos/').listSync();
    }
    on FileSystemException {
      print("Directory not initialized.");
    }
    return res;
  }

  // Check if restaurant already exists in the Map<>
  static dynamic _restaurantVisited(Restaurant res, Map photos) {
    for (Restaurant restaurant in photos.keys) {
      if (res.id.compareTo(restaurant.id) == 0) {
        return restaurant;
      }
    }
    return null;
  }

  static File openImgFile(FileSystemEntity dir) {
    return File('${dir.path}/img.jpg');
  }

  static File openContentFile(FileSystemEntity dir) {
    return File('${dir.path}/contents.json');
  }
}