import 'package:foodprint/places_data/place_response.dart';
import 'package:foodprint/places_data/result.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Locator {
  // Google Maps Search
  static const String _API_KEY = "AIzaSyCmqpu5zqDTZzDPLYTpWhMNGOz2CHOmUNU";
  static const String baseUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json";

  static Future<LocationData> getLocation() async {
    final Location location = Location();
    LocationData pos;
    try {
      print("Initializing position details");
      pos = await location.getLocation();
    }
    catch (e) {
      print(e);
    }
    return pos;
  }

  static Future<List<Result>> getRestaurants(LocationData location) async {

    print("Searching for nearby restaurants");
    String url = '$baseUrl?key=$_API_KEY&location=${location.latitude},${location.longitude}&rankby=distance&type=restaurant';
    print(url);
    try {
      final response = await http.get(url);
      final data = json.decode(response.body);
      return _parseRestaurants(data);
    }
    catch (e) {
      print(e);
    }
    return [];
  }

  // Parse nearby restaurant results
  static List<Result> _parseRestaurants(data){
    // bad api key or otherwise
    if (data['status'] == "REQUEST_DENIED") {
      throw Exception('Request denied');
    } else if (data['status'] == "OK") {
      final restaurants = PlaceResponse.parseResults(data['results']).sublist(0, 5); // 5 closest restaurants
      return restaurants;
    } else {
      print(data);
    }
    return [];
  }
}
