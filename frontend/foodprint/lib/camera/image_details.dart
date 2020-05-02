import 'package:flutter/material.dart';
import 'package:foodprint/models/photo.dart';
import 'package:foodprint/places_data/photo.dart';
import 'package:foodprint/places_data/place_response.dart';
import 'package:foodprint/places_data/result.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:location/location.dart';

class ImageDetail extends StatefulWidget {
  @override
  _ImageDetailState createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {

  // Date
  final Map<int, String> days = {1: "Mon.", 2:"Tues.", 3:"Wed.", 4:"Thurs.", 5:"Fri.", 6:"Sat.", 7:"Sun."};
  final Map<int, String> months =
  {1: "Jan.", 2:"Feb.", 3:"Mar.", 4:"Apr.", 5:"May", 6:"June", 7:"July", 8:"Aug.", 9:"Sept.", 10:"Oct.", 11: "Nov.", 12:"Dec."};

  // Fields
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _itemNameController = TextEditingController();

  LocationData _position;
  List<Result> _restaurants;

  // Google Maps Search
  static const String _API_KEY = 'AIzaSyAUL23sK22O2cNSb6VVCEYeRJn_Tg8MCzo';
  static const String baseUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json";

  Future<void> _setLocationAndAddress(PhotoModel photoModel) async {
    final Location location = Location();

    try {
      print("Initializing position details");
      _position = await location.getLocation();
      print("${_position.latitude}, ${_position.longitude}");

      // Update model
      photoModel.coords = "${_position.latitude}, ${_position.longitude}";
      //photoModel.address = await _getAddressFromLatLng(geolocator, _position);

      print("Searching for nearby restaurants");
      String url = '$baseUrl?key=$_API_KEY&location=${_position.latitude},${_position.longitude}&rankby=distance&type=restaurant';
      print(url);
      final response = await http.get(url);
      final data = json.decode(response.body);
      _handleResponse(data);
    } catch (e) {
      print(e);
    }
  }

  // Parse nearby restaurant results
  void _handleResponse(data){
    // bad api key or otherwise
    if (data['status'] == "REQUEST_DENIED") {
      throw Exception('Request denied');
    } else if (data['status'] == "OK") {
      _restaurants = PlaceResponse.parseResults(data['results']).sublist(0, 5);
      _restaurants.forEach((element) => print(element.name));
    } else {
      print(data);
    }
  }

  // Convert LatLng to Address
  /*Future<String> _getAddressFromLatLng(Geolocator geolocator, Position position) async {
    Placemark place;
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          position.latitude, position.longitude);
      place = p[0];
    } catch (e) {
      print(e);
    }
    return '${place.locality}, ${place.postalCode}, ${place.country}';
  }*/

  // Format datetime
  String _getDateTime() {
    final DateTime now = new DateTime.now();
    String y = now.year.toString();
    String m = months[now.month];
    String wd = days[now.weekday];
    String d = now.day.toString();
    String h = now.hour.toString();
    String min = now.minute < 10 ? "0${now.minute.toString()}" : now.minute.toString();
    return "$wd, $m $d, $y ~ $h.$min";
  }

  @override
  Widget build(BuildContext context) {
    PhotoModel photoModel = Provider.of<PhotoModel>(context);
    _setLocationAndAddress(photoModel);
    photoModel.datetime = _getDateTime();
    return Column(
      children: <Widget>[
        TextField(
          controller: _itemNameController,
          decoration: InputDecoration(
            labelText: "Item Name",
          ),
          onChanged: (text) {
            photoModel.name = text;
          },
        ),
        // TODO: Price input validation
        TextField(
          controller: _priceController,
          decoration: InputDecoration(
            labelText: "Price",
          ),
          onChanged: (text) {
            photoModel.price = text;
          },
        ),
        TextField(
          controller: _captionController,
          maxLines: 10,
          decoration: InputDecoration(
            labelText: "Caption",
          ),
          onChanged: (text) {
            photoModel.caption = text;
          },
        ),

      ],
    );
  }

  @override
  void dispose() {
    _captionController.dispose();
    _priceController.dispose();
    _itemNameController.dispose();
    super.dispose();
  }
}
