
import 'dart:convert' show jsonEncode;
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodprint/infrastructure/core/tokens.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/places_data/restaurant_result.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:foodprint/service/foodprint_extension.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';

class UserModel extends ChangeNotifier {
  LatLng _location;
  String _username;
  int _id;
  Map<String, dynamic> _payload;
  String _jwt;
  Map<Restaurant, List<FoodprintPhoto>> _foodprint;

  UserModel(LatLng location, String jwt, Map<String, dynamic> payload, Map<Restaurant, List<FoodprintPhoto>> foodprint) {
    _location = location;
    _jwt = jwt;
    _payload = payload;
    _username = payload['username'] as String;
    _id = payload['sub'] as int;
    _foodprint = foodprint;
  }

  // Getters
  LatLng get location => _location;
  String get username => _username;
  int get id => _id;
  String get jwt => _jwt;
  Map<String, dynamic> get payload => _payload;
  Map<Restaurant, List<FoodprintPhoto>> get foodprint => _foodprint;
  int get secondsSinceEpoch => (DateTime.now().millisecondsSinceEpoch / 1000).round();

  // Format datetime
  String get currentTimestamp {
    final DateTime now = DateTime.now();
    final String y = now.year.toString();
    final String m = now.month < 10 ? "0${now.month}" : now.month.toString();
    final String d = now.day.toString();
    final String h = now.hour.toString();
    final String min = now.minute < 10 ? "0${now.minute}" : now.minute.toString();
    final String second = now.second < 10 ? "0${now.second}" : now.second.toString();
    return "$y-$m-$d $h:$min:$second-04"; // TODO: handle timezone
  }

  Future<bool> savePhoto(File image, String name, String price, String comments, RestaurantResult restaurant) async {
    final String timestamp = currentTimestamp;
    try {

      // Get filename of the image
      final String fileName = basename(image.path);
      final String imgPath = '$_id/photos/$secondsSinceEpoch-$fileName';
      final Uint8List imgBytes = image.readAsBytesSync();

      // Image information
      final String body = jsonEncode({
        "userId": _id.toString(),
        "image": {
          "path": imgPath,
          "data": imgBytes.toString(),
          "details": {
            "name": name,
            "price": price,
            "caption": comments,
            "timestamp": timestamp,
          },
          "location": {
            "id": restaurant.placeId,
            "name": restaurant.name,
            "rating": restaurant.rating.toString(),
            "lat": restaurant.lat.toString(),
            "lng": restaurant.lng.toString()
          }
        }
      });

      // Save remotely
      final res = await http.post(
          "$serverIP/api/photos/",
          headers: {
            "Content-Type": 'application/json'
          },
          body: body
      );

      if (res.statusCode == 200) {
        final FoodprintPhoto newPhoto = FoodprintPhoto(
          storagePath: imgPath,
          imgBytes: imgBytes,
          name: name,
          price: double.parse(price),
          caption: comments,
          restaurantId: restaurant.placeId,
          timestamp: timestamp.substring(0, timestamp.length-3),
        );

        final Restaurant newRes = Restaurant(
          id: restaurant.placeId,
          name: restaurant.name,
          rating: restaurant.rating,
          latitude: restaurant.lat,
          longitude: restaurant.lng,
        );

        _foodprint = _foodprint.addPhoto(newPhoto, newRes);
        notifyListeners();
        return true;
      }
      else if (res.statusCode == 401) {
        Fluttertoast.showToast(
          msg: res.body,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
        );
        return false;
      }
    } catch (e) {
      print(e);
    }
    return false;
  }

  Future<void> deletePhoto(FoodprintPhoto photo) async {
    final res = await http.delete(
      "$serverIP/api/photos/",
      headers: {
        "photo_path": photo.storagePath
      }
    );
    if (res.statusCode == 200) {
      _foodprint = _foodprint.removePhoto(photo);
      notifyListeners();
    }
  }

  Future<void> editPhoto(FoodprintPhoto oldPhoto, String name, String price, String comments) async {
    final res = await http.put(
      "$serverIP/api/photos",
      body: {
        "path": oldPhoto.storagePath,
        "photo_name": name,
        "price": price.toString(),
        "caption": comments
      }
    );

    if (res.statusCode == 200) {
      final FoodprintPhoto newPhoto = FoodprintPhoto(
          storagePath: oldPhoto.storagePath,
          name: name,
          price: double.parse(price),
          caption: comments,
          restaurantId: oldPhoto.restaurantId,
          timestamp: oldPhoto.timestamp,
          imgBytes: oldPhoto.imgBytes
      );
      _foodprint = _foodprint.editPhoto(newPhoto);
      notifyListeners();
    }
  }
}

