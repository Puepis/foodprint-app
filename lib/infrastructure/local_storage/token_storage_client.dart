import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodprint/domain/core/exceptions.dart';
import 'package:foodprint/domain/local_storage/i_local_token_repository.dart';

class TokenStorageClient implements LocalTokenRepository {
  final FlutterSecureStorage storage;

  TokenStorageClient({@required this.storage});

  @override
  Future<String> getRefreshToken() async {
    final tokenString = await storage.read(key: "refresh_token");
    if (tokenString != null) {
      return tokenString;
    } else {
      throw TokenNotFoundException();
    }
  }

  @override
  Future<void> storeRefreshToken(String token) async {
    await storage.write(key: "refresh_token", value: token);
  }

  @override
  Future<void> deleteRefreshToken() async {
    await storage.delete(key: "refresh_token");
  }
}
