import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/camera/image_details.dart';
import 'package:foodprint/models/gallery_model.dart';
import 'package:foodprint/places_data/place_response.dart';
import 'package:foodprint/places_data/result.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class RestaurantListing extends StatelessWidget {
  final String username;
  final File imageFile;
  final GalleryModel gallery;
  final List<Result> restaurants;
  RestaurantListing({Key key, @required this.username, @required this.imageFile, @required this.gallery,
     @required this.restaurants}) : super(key: key);

  Widget _listRestaurants() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => Column(
          children: [
            RaisedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ImageDetail(
                      username: username,
                      imageFile: imageFile,
                      gallery: gallery,
                      restaurant: restaurants[index],
                    )
                ));
              },
              child: Text(restaurants[index].name),
            )
          ],
        )
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text(
              "Here's what we found",
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30
              ),
            ),
            if (restaurants != null) _listRestaurants()
          ],
        ),
      ),
    );
  }
}

class Locator {
  // Google Maps Search
  static const String _API_KEY = 'AIzaSyAUL23sK22O2cNSb6VVCEYeRJn_Tg8MCzo';
  static const String baseUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json";

  static Future<LocationData> getLocation() async {
    final Location location = Location();
    LocationData pos;
    try {
      print("Initializing position details");
      pos = await location.getLocation();
      print("${pos.latitude}, ${pos.longitude}");
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
      restaurants.forEach((element) => print(element.name));
      return restaurants;
    } else {
      print(data);
    }
    return [];
  }
}
