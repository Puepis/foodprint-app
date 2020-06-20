
import 'package:flutter/material.dart';
import 'package:foodprint/models/dashboard_args.dart';
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
          TokenAuth.routeName: (context) => const TokenAuth(),
          LoginPage.routeName: (context) => LoginPage(),
          RegisterPage.routeName: (context) => RegisterPage(),
        },
        onGenerateRoute: (settings) {
          // Extract arguments and build route
          if (settings.name == Dashboard.routeName) {
            final DashboardArgs args = settings.arguments as DashboardArgs;
            return MaterialPageRoute(
              builder: (context) {
                return Dashboard(
                  location: args.location,
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
