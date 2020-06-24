import 'package:auto_route/auto_route_annotations.dart';
import 'package:foodprint/presentation/home/dashboard.dart';
import 'package:foodprint/presentation/login_page/login_page.dart';
import 'package:foodprint/presentation/splash/splash_page.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $Router {
  @initial
  SplashPage splashPage;
  LoginPage loginPage;
  HomePage dashboard;
}