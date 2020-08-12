
abstract class LocalTokenRepository {
  /// Fetches the stored refresh token that is used to persist user sessions
  /// and renew access tokens. 
  ///
  /// Throws [TokenException] if no token is found
  Future<String> getRefreshToken();

  Future<void> storeRefreshToken(String token);

  Future<void> deleteRefreshToken();
}
