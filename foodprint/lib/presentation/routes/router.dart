import 'package:auto_route/auto_route_annotations.dart';
import 'package:foodprint/presentation/pages/login_page.dart';
import 'package:foodprint/presentation/splash/splash_page.dart';

@MaterialAutoRouter(generateNavigationHelperExtension: true)
class $Router {
  @initial
  SplashPage splashPage;
  LoginPage loginPage;
}