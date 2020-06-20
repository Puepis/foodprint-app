import 'dart:convert' show ascii, base64, json, jsonDecode;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/foodprint_response.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:foodprint/service/locator.dart';
import 'package:foodprint/widgets/auth/login_page.dart';
import 'package:foodprint/widgets/auth/tokens.dart';
import 'package:foodprint/widgets/dashboard.dart';
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

enum Status { unauthorized, authorized, pending }

class _AuthorizationPortalState extends State<AuthorizationPortal> {

  Status _authStatus = Status.pending;
  LatLng _currentPos;
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
      case Status.authorized: {
        result = Dashboard(
          location: _currentPos,
          userFoodprint: _userFoodprint,
          jwt: widget.jwt,
          payload: widget.payload,
        );
      }
      break;
      case Status.pending: {
        result =  Scaffold(
          backgroundColor: Colors.white,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
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
            ),
          ),
        );
      }
      break;
      case Status.unauthorized: {result = LoginPage();}
      break;
    }
    return result;
  }

  // Authorize token, retrieve data, and set location
  Future<void> _setUserFoodprintAndLocation() async {
    final LatLng location = await Geolocator.getLocation();

    final res = await http.get(
        '$SERVER_IP/api/users/foodprint',
        headers: {"authorization": "Bearer ${widget.jwt}"}
    );

    switch(res.statusCode) {
      case 200: {
        final FoodprintResponse response = FoodprintResponse.fromJson(jsonDecode(res.body) as Map<String, dynamic>);
        setState(() {
          _authStatus = Status.authorized;
          _currentPos = location;
          _userFoodprint = response.foodprint;
        });
      }
      break;
      case 403: { // unauthorized
        print(res.body);
        setState(() {
          _authStatus = Status.unauthorized;
        });
      }
      break;
      case 400: { // error getting photos
        print(res.body);
        setState(() {
          _authStatus = Status.authorized;
          _currentPos = location;
        });
      }
      break;
      default: { // unexpected error
        print(res.statusCode);
        print(res.body);
        setState(() {
          _authStatus = Status.unauthorized; // TODO: Handle unexpected error
        });
      }
    }
  }
}
