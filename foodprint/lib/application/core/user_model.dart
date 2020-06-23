import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/i_photo_repository.dart';
import 'package:foodprint/domain/photos/photo_detail_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:injectable/injectable.dart';
import 'package:path/path.dart';

@injectable
class UserModel extends ChangeNotifier {
  final IPhotoRepository _client;

  LatLng _location;
  String _username;
  int _id;
  Map<String, dynamic> _payload;
  String _jwt;
  FoodprintEntity _foodprint;

  UserModel(this._client);

  // Getters
  LatLng get location => _location;
  String get username => _username;
  int get id => _id;
  String get jwt => _jwt;
  Map<String, dynamic> get payload => _payload;
  FoodprintEntity get foodprint => _foodprint;
  int get secondsSinceEpoch =>
      (DateTime.now().millisecondsSinceEpoch / 1000).round();

  // Format datetime
  String get currentTimestamp {
    final DateTime now = DateTime.now();
    final String y = now.year.toString();
    final String m = now.month < 10 ? "0${now.month}" : now.month.toString();
    final String d = now.day.toString();
    final String h = now.hour.toString();
    final String min =
        now.minute < 10 ? "0${now.minute}" : now.minute.toString();
    final String second =
        now.second < 10 ? "0${now.second}" : now.second.toString();
    return "$y-$m-$d $h:$min:$second-04"; // TODO: handle timezone
  }

  Future<void> savePhoto(
      {File image,
      String name,
      String price,
      String comments,
      RestaurantEntity restaurant}) async {
    final String timestamp = currentTimestamp;

    // Get filename of the image
    final String fileName = basename(image.path);
    final String imgPath = '$_id/photos/$secondsSinceEpoch-$fileName';
    final List<int> imgBytes = image.readAsBytesSync().toList();

    // Construct new photo
    final PhotoEntity newPhoto = PhotoEntity(
      storagePath: StoragePath(imgPath),
      imageData: PhotoData(imgBytes),
      photoDetail: PhotoDetailEntity(
          name: PhotoName(name),
          price: PhotoPrice(double.parse(price)),
          comments: PhotoComments(comments)),
      timestamp: Timestamp(timestamp.substring(0, timestamp.length - 3)),
    );

    notifyListeners();
  }

  Future<void> deletePhoto() async {}

  Future<void> editPhoto(String name, String price, String comments) async {}
}
