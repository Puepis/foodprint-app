
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';

class Geolocator {
  // Google Maps Search
  
  static Future<dynamic> getLocation() async {

    final Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData pos;

    // Check service
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;  // default location
      }
    }

    // Check permissions
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    pos = await location.getLocation(); // get location
    return LatLng(pos.latitude, pos.longitude);
  }
}
