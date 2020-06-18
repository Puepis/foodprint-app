
import 'package:flutter/material.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:foodprint/service/foodprint_methods.dart';
import 'package:foodprint/widgets/auth/tokens.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;

class UserModel extends ChangeNotifier {
  String _username;
  int _id;
  Map<String, dynamic> _payload;
  String _jwt;
  List<FoodprintPhoto> _photos;
  Map<Restaurant, List<FoodprintPhoto>> _foodprint;

  UserModel(String jwt, Map<String, dynamic> payload,
      List<FoodprintPhoto> photos, Map<Restaurant, List<FoodprintPhoto>> foodprint) {
    _jwt = jwt;
    _payload = payload;
    _username = payload['username'] as String;
    _id = payload['sub'] as int;
    _photos = photos;
    _foodprint = foodprint;
  }

  // Getters
  String get username => _username;
  int get id => _id;
  String get jwt => _jwt;
  Map<String, dynamic> get payload => _payload;
  List<FoodprintPhoto> get photos => _photos;
  Map<Restaurant, List<FoodprintPhoto>> get foodprint => _foodprint;

  // Update the user's photos and foodprint
  void addPhoto(FoodprintPhoto photo) {
    _photos.insert(0, photo);
    _foodprint = UserFoodprint.addPhoto(photo, _foodprint);
    notifyListeners();
  }

  Future<void> deletePhoto(FoodprintPhoto photo) async {
    final res = await http.delete(
      "$SERVER_IP/api/photos/",
      headers: {
        "photo_path": photo.storagePath
      }
    );
    if (res.statusCode == 200) {
      _photos.removeWhere((e) =>
      e.storagePath.compareTo(photo.storagePath) == 0);
      _foodprint = UserFoodprint.removePhoto(photo, _foodprint);
      notifyListeners();
      return true;
    }
    else {
      return false;
    }
  }
}