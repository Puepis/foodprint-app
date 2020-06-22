// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:foodprint/presentation/splash/splash_page.dart';
import 'package:foodprint/presentation/pages/login_page.dart';

abstract class Routes {
  static const splashPage = '/';
  static const loginPage = '/login-page';
  static const all = {
    splashPage,
    loginPage,
  };
}

class Router extends RouterBase {
  @override
  Set<String> get allRoutes => Routes.all;

  @Deprecated('call ExtendedNavigator.ofRouter<Router>() directly')
  static ExtendedNavigatorState get navigator =>
      ExtendedNavigator.ofRouter<Router>();

  @override
  Route<dynamic> onGenerateRoute(RouteSettings settings) {
    final args = settings.arguments;
    switch (settings.name) {
      case Routes.splashPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => SplashPage(),
          settings: settings,
        );
      case Routes.loginPage:
        if (hasInvalidArgs<LoginPageArguments>(args)) {
          return misTypedArgsRoute<LoginPageArguments>(args);
        }
        final typedArgs = args as LoginPageArguments ?? LoginPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoginPage(key: typedArgs.key),
          settings: settings,
        );
      default:
        return unknownRoutePage(settings.name);
    }
  }
}

// *************************************************************************
// Arguments holder classes
// **************************************************************************

//LoginPage arguments holder class
class LoginPageArguments {
  final Key key;
  LoginPageArguments({this.key});
}

// *************************************************************************
// Navigation helper methods extension
// **************************************************************************

extension RouterNavigationHelperMethods on ExtendedNavigatorState {
  Future pushSplashPage() => pushNamed(Routes.splashPage);

  Future pushLoginPage({
    Key key,
  }) =>
      pushNamed(
        Routes.loginPage,
        arguments: LoginPageArguments(key: key),
      );
}
