

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
    print("Getting token");
    final tokenString = await storage.read(key: "jwt");
    if (tokenString != null) {
      return JWT(token: tokenString);
    } else {
      throw TokenNotFoundException();
    }
  }

  @override
  Future<void> storeUserToken(JWT token) async {
    print("Storing token");
    await storage.write(key: "jwt", value: token.getOrCrash());
  }

  @override
  Future<void> deleteUserToken() async {
    print("Deleting token");
    await storage.delete(key: "jwt");
  }
}