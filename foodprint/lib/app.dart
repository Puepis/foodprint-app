
import 'package:flutter/material.dart';
import 'package:foodprint/auth/login_page.dart';
import 'package:foodprint/auth/tokens.dart';
import 'package:foodprint/portal.dart';
import 'dart:convert' show json, ascii, base64;

class FoodprintApp extends StatelessWidget {
  const FoodprintApp();

  Future<String> get jwtOrEmpty async {
    var jwt = await storage.read(key: "jwt");
    return jwt == null ? "" : jwt;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodprint',
      theme: _foodprintTheme,
      home: FutureBuilder(
        future: jwtOrEmpty,
        builder: (context, snapshot) {
          // Loading
          if(!snapshot.hasData) return CircularProgressIndicator();

          // JSON Web Token
          if (snapshot.data != "") {
            String jwtStr = snapshot.data;
            List jwtParts = jwtStr.split(".");

            if (jwtParts.length != 3) {
              return LoginPage(); // invalid token
            } else {
              // Decode the payload
              var payload = json.decode(ascii.decode(base64.decode(base64.normalize(jwtParts[1]))));

              // Check if token expired
              DateTime expiry = DateTime.fromMillisecondsSinceEpoch(payload["exp"]*1000);
              if (expiry.isAfter(DateTime.now())) {
                 return Portal(
                   jwt: jwtStr,
                   payload: payload,
                 ); // not expired
              }
              else {
                // Delete expired token
                storage.delete(key: "jwt");
                return LoginPage();
              }
            }
          } else {
            return LoginPage(); // No existing token
          }
        },
      ),
    );
  }
}

// Overall theme
final ThemeData _foodprintTheme = _buildFoodprintTheme();

// Set overall theme of the app
ThemeData _buildFoodprintTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
  );
}