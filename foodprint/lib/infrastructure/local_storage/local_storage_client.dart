

import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/core/exceptions.dart';
import 'package:foodprint/domain/local_storage/i_jwt_local_repository.dart';


class JWTStorageClient implements JWTLocalRepository {
  final FlutterSecureStorage storage;

  JWTStorageClient({@required this.storage});

  @override
  Future<JWT> getUserToken() async {
    final tokenString = await storage.read(key: "jwt");
    if (tokenString != null) {
      return JWT(token: tokenString);
    } else {
      throw TokenException();
    }
  }

  @override
  Future<void> storeUserToken(JWT token) async {
    await storage.write(key: "jwt", value: token.getOrCrash());
  }

  @override
  Future<void> deleteUserToken() async {
    await storage.delete(key: "jwt");
  }
}