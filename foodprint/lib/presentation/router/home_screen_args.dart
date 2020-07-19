import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';

class HomeScreenArgs {
  final JWT token;
  HomeScreenArgs({@required this.token});
}
