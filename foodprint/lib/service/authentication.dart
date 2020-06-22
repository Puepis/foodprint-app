
import 'package:foodprint/infrastructure/core/tokens.dart';

import 'package:http/http.dart' as http;
class AuthenticationService {
 
  static Future<bool> attemptLogout(String username) async {
    final res = await http.post(
        "$serverIP/api/users/logout",
        body: {
          "username": username
        }
    );
    return res.statusCode == 200;
  }
}
