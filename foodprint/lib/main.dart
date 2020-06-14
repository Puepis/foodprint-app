
import 'package:flutter/material.dart';
import 'package:foodprint/home.dart';
import 'package:foodprint/models/home_page_args.dart';
import 'package:foodprint/token_verification.dart';
import 'package:foodprint/auth/login_page.dart';
import 'package:foodprint/auth/register_page.dart';

void main() {
  runApp(
      MaterialApp(
        title: 'Foodprint',
        theme: _foodprintTheme,
        initialRoute: '/',
        routes: {
          TokenAuth.routeName: (context) => TokenAuth(),
          LoginPage.routeName: (context) => LoginPage(),
          RegisterPage.routeName: (context) => RegisterPage(),
        },
        onGenerateRoute: (settings) {
          if (settings.name == HomePage.routeName) {
            final HomePageArgs args = settings.arguments;
            return MaterialPageRoute(
              builder: (context) {
                return HomePage(
                  location: args.location,
                  photos: args.photos,
                  userFoodprint: args.userFoodprint,
                  jwt: args.jwt,
                  payload: args.payload,
                );
              },
            );
          }
          assert(false, 'Need to implement ${settings.name}');
          return null;
        },
      )
  );
}

// Overall theme
final ThemeData _foodprintTheme = _buildFoodprintTheme();

// Set overall theme of the app
ThemeData _buildFoodprintTheme() {
  return ThemeData(
    primarySwatch: Colors.blue,
  );
}
