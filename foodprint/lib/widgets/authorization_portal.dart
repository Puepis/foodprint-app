import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/photo_response.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:foodprint/service/locator.dart';
import 'package:foodprint/widgets/auth/login_page.dart';
import 'package:foodprint/widgets/auth/tokens.dart';
import 'package:foodprint/widgets/home.dart';
import 'dart:convert' show ascii, base64, json, jsonDecode;
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

// Think of this as middleware
class AuthorizationPortal extends StatefulWidget {
  final String jwt;
  final Map<String, dynamic> payload;

  AuthorizationPortal({Key key, @required this.jwt, @required this.payload}) : super(key: key);

  factory AuthorizationPortal.fromJWT(String jwt) {
    String payloadStr = jwt.split(".")[1];
    return AuthorizationPortal(
      jwt: jwt,
      payload: json.decode(ascii.decode(base64.decode(base64.normalize(payloadStr))))
    );
  }

  @override
  _AuthorizationPortalState createState() => _AuthorizationPortalState();
}

class _AuthorizationPortalState extends State<AuthorizationPortal> {

  int _authStatus = PENDING;
  static const int UNAUTHORIZED = 0;
  static const int AUTHORIZED = 1;
  static const int PENDING = 2;
  LatLng _currentPos;
  PhotoResponse _photoResponse;
  Map<Restaurant, List<FoodprintPhoto>> _userFoodprint;

  @override
  void initState() {
    super.initState();
    _setUserFoodprintAndLocation();
  }

  @override
  Widget build(BuildContext context) {
    Widget result;
    switch(_authStatus) {
      case AUTHORIZED: {
        result = HomePage(
          location: _currentPos,
          photos: _photoResponse.photos,
          userFoodprint: _userFoodprint,
          jwt: widget.jwt,
          payload: widget.payload,
        );
      }
      break;
      case PENDING: {
        result =  Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SpinKitDualRing(color: Colors.blue, size: 70.0,),
                  SizedBox(height: 20.0),
                  Text(
                    "Authorizing",
                    style: TextStyle(
                      fontSize: 40.0,
                      fontWeight: FontWeight.bold
                    ),
                  )
                ],
              )
            ),
          ),
        );
      }
      break;
      case UNAUTHORIZED: {result = LoginPage();}
      break;
    }
    return result;
  }

  // Authorize token, retrieve data, and set location
  void _setUserFoodprintAndLocation() async {
    LatLng location = await Geolocator.getLocation();
    var res = await http.get(
        '$SERVER_IP/api/users/photos',
        headers: {"authorization": "Bearer ${widget.jwt}"}
    );

    switch(res.statusCode) {
      case 200: {
        print("Photos retrieved");
        PhotoResponse response = PhotoResponse.fromJson(jsonDecode(res.body));
        setState(() {
          _authStatus = AUTHORIZED;
          _currentPos = location;
          _photoResponse = response;
          _userFoodprint = _sortByRestaurant(response);
        });
      }
      break;
      case 403: { // unauthorized
        print(res.body);
        setState(() {
          _authStatus = UNAUTHORIZED;
        });
      }
      break;
      case 400: { // error getting photos
        print(res.body);
        setState(() {
          _authStatus = AUTHORIZED;
          _currentPos = location;
        });
      }
      break;
      default: { // unexpected error
        print(res.statusCode);
        print(res.body);
        setState(() {
          _authStatus = UNAUTHORIZED; // TODO: Handle unexpected error
        });
      }
    }
  }

  // TODO: Move to separate file
  // Organize the photos to display on the map
  Map<Restaurant, List<FoodprintPhoto>> _sortByRestaurant(PhotoResponse response) {
    Map<Restaurant, List<FoodprintPhoto>> result = Map();
    response.photos.forEach((photo) {
      var rv = _restaurantKey(photo.restaurantId, result);
      if (rv == null) { // generate new key
        Restaurant place = Restaurant(
            id: photo.restaurantId,
            name: photo.restaurantName,
            rating: photo.restaurantRating,
            latitude: photo.latitude,
            longitude: photo.longitude
        );
        result[place] = [photo];
      }
      else {
        result[rv].insert(0, photo);
      }
    });
    return result;
  }

  dynamic _restaurantKey(String id, Map photos) {
    for (Restaurant restaurant in photos.keys) {
      if (id.compareTo(restaurant.id) == 0) { // compare restaurant ids
        return restaurant;
      }
    }
    return null;
  }
}
