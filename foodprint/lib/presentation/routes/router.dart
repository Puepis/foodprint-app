import 'package:auto_route/auto_route_annotations.dart';
import 'package:foodprint/presentation/home/home_page.dart';
import 'package:foodprint/presentation/home/home_screen.dart';
import 'package:foodprint/presentation/home/loading_page.dart';
import 'package:foodprint/presentation/login_page/login_page.dart';
import 'package:foodprint/presentation/register_page/register_page.dart';
import 'package:foodprint/presentation/splash/splash_page.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $Router {
  @initial
  SplashPage splashPage;
  LoginPage loginPage;
  RegisterPage registerPage;
  HomePage homePage;
  HomeScreen homeScreen;
  LoadingPage loadingFoodprintPage;
}