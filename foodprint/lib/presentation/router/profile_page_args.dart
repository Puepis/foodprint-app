import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';

class ProfilePageArgs {
  final JWT token;
  final FoodprintEntity foodprint;
  ProfilePageArgs({@required this.token, @required this.foodprint});
}
