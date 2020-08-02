import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';

class EditProfileArgs {
  final JWT token;
  EditProfileArgs({@required this.token});
}
