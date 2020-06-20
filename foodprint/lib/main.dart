
import 'package:flutter/material.dart';
import 'package:foodprint/home.dart';
import 'package:foodprint/widgets/auth/login_page.dart';
import 'package:foodprint/widgets/auth/register_page.dart';
import 'package:foodprint/widgets/dashboard.dart';
import 'package:foodprint/widgets/token_verification.dart';

void main() {
  runApp(
      MaterialApp(
        title: 'Foodprint',
        theme: _foodprintTheme,
        initialRoute: '/',
        routes: {
          "/home": (context) => HomePage(),
          TokenAuth.routeName: (context) => const TokenAuth(),
          LoginPage.routeName: (context) => LoginPage(),
          RegisterPage.routeName: (context) => RegisterPage(),
          Dashboard.routeName: (context) => Dashboard(),
        },
      )
  );
}

// Overall theme
final ThemeData _foodprintTheme = ThemeData(
    primarySwatch: Colors.deepOrange,
  );
