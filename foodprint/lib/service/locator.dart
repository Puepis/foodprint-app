
import 'dart:convert';
import 'package:foodprint/models/places_data/google_place_response.dart';
import 'package:foodprint/models/places_data/restaurant_result.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class Geolocator {
  // Google Maps Search
  static const String _apiKey = "AIzaSyCmqpu5zqDTZzDPLYTpWhMNGOz2CHOmUNU";
  static const String baseUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json";
  static const LatLng toronto = LatLng(43.651070, -79.347015);

  static Future<LatLng> getLocation() async {

    final Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData pos;

    // Check service
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return toronto; // default location
      }
    }

    // Check permissions
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return toronto;
      }
    }
    pos = await location.getLocation(); // get location
    return LatLng(pos.latitude, pos.longitude);
  }

  static Future<List<RestaurantResult>> getRestaurants(LatLng location) async {
    final String url = '$baseUrl?key=$_apiKey&location=${location.latitude},${location.longitude}&rankby=distance&type=restaurant';
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      return _parseRestaurants(data);
    }
    catch (e) {
      print(e);
      return [];
    }
  }

  // Parse nearby restaurant results
  static List<RestaurantResult> _parseRestaurants(data){
    // bad api key or otherwise
    if (data['status'] == "REQUEST_DENIED") {
      throw Exception('Request denied');
    } else if (data['status'] == "OK") {
      final restaurants = GooglePlaceResponse.parseResults(data['results'] as List).sublist(0, 5); // 5 closest restaurants
      return restaurants;
    } else {
      print(data);
    }
    return [];
  }
}
