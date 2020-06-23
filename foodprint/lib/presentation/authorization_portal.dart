import 'dart:convert' show ascii, base64, json, jsonDecode;
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprint/presentation/pages/login_page.dart';
import 'package:foodprint/widgets/dashboard.dart';
import 'package:provider/provider.dart';

// Think of this as middleware
class AuthorizationPortal extends StatefulWidget {

  factory AuthorizationPortal.fromJWT(String jwt) {
    return AuthorizationPortal(
      jwt: jwt,
      payload: json.decode(ascii.decode(base64.decode(base64.normalize(payloadStr)))) as Map<String, dynamic>
    );
  }

  @override
  _AuthorizationPortalState createState() => _AuthorizationPortalState();
}


class _AuthorizationPortalState extends State<AuthorizationPortal> {

 
  @override
  Widget build(BuildContext context) {
    Widget result;
    switch(_authStatus) {
      case Status.authorized: {
        result = ChangeNotifierProvider(
          create: (context) => UserModel(_currentPos, widget.jwt, widget.payload, _userFoodprint),
          child: Dashboard(),
        );
      }
      break;
      case Status.pending: {
        result =  Scaffold(
          backgroundColor: Colors.deepOrange,
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SpinKitDualRing(color: Colors.white, size: 70.0,),
                SizedBox(height: 20.0),
                Text(
                  "Authorizing",
                  style: TextStyle(
                    color: Colors.white,
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

 
}
