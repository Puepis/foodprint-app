import 'package:flutter/material.dart';
import 'package:foodprint/home.dart';
import 'package:foodprint/presentation/pages/login_page.dart';
import 'package:foodprint/presentation/pages/register_page.dart';
import 'package:foodprint/widgets/dashboard.dart';
import 'package:foodprint/widgets/token_verification.dart';

class FoodprintApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Foodprint',
      theme: _foodprintTheme,
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        "/home": (context) => HomePage(),
        TokenAuth.routeName: (context) => const TokenAuth(),
        LoginPage.routeName: (context) => const LoginPage(),
        RegisterPage.routeName: (context) => const RegisterPage(),
        Dashboard.routeName: (context) => Dashboard(),
      },
    );
  }
}

// Overall theme
final ThemeData _foodprintTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
);
