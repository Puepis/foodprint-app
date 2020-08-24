import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';

class HomeScreenArgs {
  final JWT token;
  final bool firstLogin;
  HomeScreenArgs({@required this.token, @required this.firstLogin});
}
