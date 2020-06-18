import 'dart:convert' show ascii, base64, json, jsonDecode;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/photo_response.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:foodprint/service/foodprint_methods.dart';
import 'package:foodprint/service/locator.dart';
import 'package:foodprint/widgets/auth/login_page.dart';
import 'package:foodprint/widgets/auth/tokens.dart';
import 'package:foodprint/widgets/home.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;

// Think of this as middleware
class AuthorizationPortal extends StatefulWidget {
  final String jwt;
  final Map<String, dynamic> payload;

  const AuthorizationPortal({Key key, @required this.jwt, @required this.payload}) : super(key: key);

  factory AuthorizationPortal.fromJWT(String jwt) {
    final String payloadStr = jwt.split(".")[1];
    return AuthorizationPortal(
      jwt: jwt,
      payload: json.decode(ascii.decode(base64.decode(base64.normalize(payloadStr)))) as Map<String, dynamic>
    );
  }

  @override
  _AuthorizationPortalState createState() => _AuthorizationPortalState();
}

class _AuthorizationPortalState extends State<AuthorizationPortal> {

  int _authStatus = pending;
  static const int unauthorized = 0;
  static const int authorized = 1;
  static const int pending = 2;
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
      case authorized: {
        result = HomePage(
          location: _currentPos,
          photos: _photoResponse.photos,
          userFoodprint: _userFoodprint,
          jwt: widget.jwt,
          payload: widget.payload,
        );
      }
      break;
      case pending: {
        result =  Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SpinKitDualRing(color: Colors.blue, size: 70.0,),
                const SizedBox(height: 20.0),
                const Text(
                  "Authorizing",
                  style: TextStyle(
                    fontSize: 40.0,
                    fontWeight: FontWeight.bold
                  ),
                )
              ],
            ),
          ),
        );
      }
      break;
      case unauthorized: {result = LoginPage();}
      break;
    }
    return result;
  }

  // Authorize token, retrieve data, and set location
  Future<void> _setUserFoodprintAndLocation() async {
    final LatLng location = await Geolocator.getLocation();
    final res = await http.get(
        '$SERVER_IP/api/users/photos',
        headers: {"authorization": "Bearer ${widget.jwt}"}
    );

    switch(res.statusCode) {
      case 200: {
        final PhotoResponse response = PhotoResponse.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
        setState(() {
          _authStatus = authorized;
          _currentPos = location;
          _photoResponse = response;
          _userFoodprint = UserFoodprint.fromResponse(response);
        });
      }
      break;
      case 403: { // unauthorized
        print(res.body);
        setState(() {
          _authStatus = unauthorized;
        });
      }
      break;
      case 400: { // error getting photos
        print(res.body);
        setState(() {
          _authStatus = authorized;
          _currentPos = location;
        });
      }
      break;
      default: { // unexpected error
        print(res.statusCode);
        print(res.body);
        setState(() {
          _authStatus = unauthorized; // TODO: Handle unexpected error
        });
      }
    }
  }
}
