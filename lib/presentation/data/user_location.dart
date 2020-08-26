import 'package:flutter/material.dart';

class UserLocation extends ChangeNotifier {
  double latitude;
  double longitude;
  UserLocation(this.latitude, this.longitude);

  void updateLocation(double lat, double lng) {
    latitude = lat;
    longitude = lng;
    notifyListeners();
  }
}
