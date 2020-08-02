import 'package:foodprint/domain/auth/jwt_model.dart';

class ChangeUsernameArgs {
  final JWT token;
  ChangeUsernameArgs(this.token);
}

class ChangePasswordArgs {
  final JWT token;
  ChangePasswordArgs(this.token);
}
