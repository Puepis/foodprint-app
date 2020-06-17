
import 'package:flutter/material.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/photo_response.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:foodprint/service/foodprint_methods.dart';

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
    _username = payload['username'];
    _id = payload['sub'];
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

  void deletePhoto(FoodprintPhoto photo) async {
    // remove photo from user foodprint
    // remove photo from photo list
    // remove photo server-side
    notifyListeners();
  }
}