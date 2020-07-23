import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';

class SettingsPageArgs {
  final JWT token;
  SettingsPageArgs({@required this.token});
}
