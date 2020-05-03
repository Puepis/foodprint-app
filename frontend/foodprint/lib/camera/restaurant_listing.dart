import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/camera/image_details.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:foodprint/models/photo.dart';
import 'package:foodprint/places_data/place_response.dart';
import 'package:foodprint/places_data/result.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:provider/provider.dart';

class RestaurantSelection extends StatefulWidget {
  final File imageFile;
  final GalleryModel gallery;
  RestaurantSelection({Key key, @required this.imageFile, @required this.gallery}) : super(key: key);
  @override
  _RestaurantSelectionState createState() => _RestaurantSelectionState();
}

class _RestaurantSelectionState extends State<RestaurantSelection> {
  LocationData _position;
  List<Result> _restaurants;
  List<bool> checked = [false, false, false, false, false];

  // Google Maps Search
  static const String _API_KEY = 'AIzaSyAUL23sK22O2cNSb6VVCEYeRJn_Tg8MCzo';
  static const String baseUrl = "https://maps.googleapis.com/maps/api/place/nearbysearch/json";

  Future<void> _findRestaurants() async {
    final Location location = Location();
    LocationData currentPos;

    try {
      print("Initializing position details");
      currentPos = await location.getLocation();
      setState(() {
        _position = currentPos;
      });
      print("${_position.latitude}, ${_position.longitude}");
      print("Searching for nearby restaurants");
      String url = '$baseUrl?key=$_API_KEY&location=${_position.latitude},${_position.longitude}&rankby=distance&type=restaurant';
      print(url);
      final response = await http.get(url);
      final data = json.decode(response.body);
      _parseRestaurants(data);
    } catch (e) {
      print(e);
    }
  }

  // Parse nearby restaurant results
  void _parseRestaurants(data){
    // bad api key or otherwise
    if (data['status'] == "REQUEST_DENIED") {
      throw Exception('Request denied');
    } else if (data['status'] == "OK") {
      setState(() {
        _restaurants = PlaceResponse.parseResults(data['results']).sublist(0, 5); // 5 closest restaurants
      });
      _restaurants.forEach((element) => print(element.name));
    } else {
      print(data);
    }
  }

  Widget _listRestaurants() {
    return ListView.builder(
        scrollDirection: Axis.vertical,
        shrinkWrap: true,
        itemCount: 5,
        itemBuilder: (context, index) => Row(
          children: [
            Checkbox(
              value: checked[index],
              onChanged: (value) {
                setState(() {
                  checked[index] = value;
                });
              },
            ),
            Text(_restaurants[index].name)
          ],
        )
    );
  }

  @override
  void initState() {
    super.initState();
    _findRestaurants(); // TODO: might need to do this earlier
  }

  @override
  Widget build(BuildContext context) {
    PhotoModel photoModel = Provider.of<PhotoModel>(context); // TODO: might need to use consumer
    if (_position != null) {
      photoModel.coords = "${_position.latitude}, ${_position.longitude}";
    }
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Here's what we found"),
            if (_restaurants != null) _listRestaurants()
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Save restaurant info
          // Fill in image details
          Navigator.push(context, MaterialPageRoute(
            builder: (context) => ImageDetail(imageFile: widget.imageFile, gallery: widget.gallery)
          ));
        },
        child: Icon(Icons.keyboard_arrow_right),
        backgroundColor: Colors.blueAccent,
      ),
    );
  }
}
