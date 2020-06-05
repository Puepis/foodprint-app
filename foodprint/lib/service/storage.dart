
import 'dart:convert';
import 'dart:io';

import 'package:foodprint/models/photo_detail.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:path_provider/path_provider.dart';

// Contains methods for retrieving content and basic file methods
class PhotoManager {
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

  static Map<Restaurant, List<List<Object>>> organizePhotos(List<FileSystemEntity> dirs) {
    // Unwrap contents, get each unique restaurant visited from PhotoDetail (id, name, rating)
    Map<Restaurant, List<List<Object>>> result = Map();
    dirs.forEach((dir) {
      File imgFile = PhotoManager.openImgFile(dir);
      File contentsFile = PhotoManager.openContentFile(dir);
      PhotoDetail contents = PhotoManager.getContents(contentsFile);

      // TODO: placeIds may change over time so try to find a way around it
      Restaurant place = Restaurant(
          id: contents.restaurantId,
          name: contents.restaurantName,
          rating: contents.rating,
          latitude: contents.latitude,
          longitude: contents.longitude
      );

      var rv = _restaurantVisited(place, result);
      if (rv == null) {
        result[place] = [[imgFile, contents]];
      }
      else {
        result[rv].insert(0, [imgFile, contents]);
      }
    });
    return result;
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

  // Fetch photo details
  static PhotoDetail getContents(File file) {
    Map<String, dynamic> photoDetail = jsonDecode(file.readAsStringSync()); // decode JSON string
    return PhotoDetail.fromJson(photoDetail);
  }

}