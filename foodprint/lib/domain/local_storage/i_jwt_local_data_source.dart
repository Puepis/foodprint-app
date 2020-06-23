

import 'package:foodprint/domain/auth/jwt_model.dart';

abstract class JWTLocalDataSource {
  /// Fetches the cached JWT which is stored every time a user logs in
  /// 
  /// Throws [TokenException] if no token is found
  Future<JWT> getUserToken();

  Future<void> storeUserToken(JWT token);

  Future<void> deleteUserToken();
} 