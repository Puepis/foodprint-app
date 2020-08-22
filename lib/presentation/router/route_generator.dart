import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/home/drawer/profile/navigator.dart';
import 'package:foodprint/presentation/home/home_screen.dart';
import 'package:foodprint/presentation/legal/legal.dart';
import 'package:foodprint/presentation/login_page/login_page.dart';
import 'package:foodprint/presentation/register_page/register_page.dart';
import 'package:foodprint/presentation/router/home_screen_args.dart';
import 'package:foodprint/presentation/router/profile/profile_navigator_args.dart';
import 'package:provider/provider.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // Getting arguments passed in while calling Navigator.pushNamed
    final args = settings.arguments;

    switch (settings.name) {
      case ProfileNavigator.routeName:
        if (args is ProfileNavigatorArgs) {
          return MaterialPageRoute(
            builder: (_) => ChangeNotifierProvider.value(
                value: args.userData, child: ProfileNavigator()),
          );
        }
        return _errorRoute();
      case TermsOfService.routeName:
        return SlideUpEnterRoute(newPage: const TermsOfService());
      case PrivacyPolicy.routeName:
        return SlideUpEnterRoute(newPage: const PrivacyPolicy());
      case LoginPage.routeOnRegisterSuccess:
        return SlideLeftRoute(newPage: const LoginPage());
      case LoginPage.routeOnLogout:
        return FadeRoute(newPage: const LoginPage());
      case RegisterPage.fromOnboarding:
        return SlideLeftRoute(newPage: const RegisterPage());
      case HomeScreen.routeOnLogin:
        if (args is HomeScreenArgs) {
          return FadeRoute(
              newPage: HomeScreen(
            token: args.token,
          ));
        }
        return _errorRoute();
      default:
        return _errorRoute();
    }
  }

  /// Generic error route
  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        body: Center(
          child: Text(
            'ERROR',
            style: TextStyle(color: errorColor, fontSize: 40),
          ),
        ),
      );
    });
  }
}
