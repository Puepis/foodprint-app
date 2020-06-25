// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:auto_route/auto_route.dart';
import 'package:foodprint/presentation/splash/splash_page.dart';
import 'package:foodprint/presentation/login_page/login_page.dart';
import 'package:foodprint/presentation/register_page/register_page.dart';
import 'package:foodprint/presentation/home/home_page.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/presentation/home/home_screen.dart';
import 'package:foodprint/presentation/home/loading_page.dart';

abstract class Routes {
  static const splashPage = '/';
  static const loginPage = '/login-page';
  static const registerPage = '/register-page';
  static const homePage = '/home-page';
  static const homeScreen = '/home-screen';
  static const loadingFoodprintPage = '/loading-foodprint-page';
  static const all = {
    splashPage,
    loginPage,
    registerPage,
    homePage,
    homeScreen,
    loadingFoodprintPage,
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
      case Routes.registerPage:
        if (hasInvalidArgs<RegisterPageArguments>(args)) {
          return misTypedArgsRoute<RegisterPageArguments>(args);
        }
        final typedArgs =
            args as RegisterPageArguments ?? RegisterPageArguments();
        return MaterialPageRoute<dynamic>(
          builder: (context) => RegisterPage(key: typedArgs.key),
          settings: settings,
        );
      case Routes.homePage:
        if (hasInvalidArgs<HomePageArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<HomePageArguments>(args);
        }
        final typedArgs = args as HomePageArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) => HomePage(
              key: typedArgs.key,
              token: typedArgs.token,
              foodprint: typedArgs.foodprint),
          settings: settings,
        );
      case Routes.homeScreen:
        if (hasInvalidArgs<HomeScreenArguments>(args, isRequired: true)) {
          return misTypedArgsRoute<HomeScreenArguments>(args);
        }
        final typedArgs = args as HomeScreenArguments;
        return MaterialPageRoute<dynamic>(
          builder: (context) =>
              HomeScreen(key: typedArgs.key, token: typedArgs.token),
          settings: settings,
        );
      case Routes.loadingFoodprintPage:
        return MaterialPageRoute<dynamic>(
          builder: (context) => LoadingPage(),
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

//RegisterPage arguments holder class
class RegisterPageArguments {
  final Key key;
  RegisterPageArguments({this.key});
}

//HomePage arguments holder class
class HomePageArguments {
  final Key key;
  final JWT token;
  final FoodprintEntity foodprint;
  HomePageArguments({this.key, @required this.token, @required this.foodprint});
}

//HomeScreen arguments holder class
class HomeScreenArguments {
  final Key key;
  final JWT token;
  HomeScreenArguments({this.key, @required this.token});
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

  Future pushRegisterPage({
    Key key,
  }) =>
      pushNamed(
        Routes.registerPage,
        arguments: RegisterPageArguments(key: key),
      );

  Future pushHomePage({
    Key key,
    @required JWT token,
    @required FoodprintEntity foodprint,
  }) =>
      pushNamed(
        Routes.homePage,
        arguments:
            HomePageArguments(key: key, token: token, foodprint: foodprint),
      );

  Future pushHomeScreen({
    Key key,
    @required JWT token,
  }) =>
      pushNamed(
        Routes.homeScreen,
        arguments: HomeScreenArguments(key: key, token: token),
      );

  Future pushLoadingFoodprintPage() => pushNamed(Routes.loadingFoodprintPage);
}
