
import 'package:foodprint/widgets/auth/tokens.dart';
import 'package:http/http.dart' as http;

class AuthenticationService {
  static Future<http.Response> attemptSignUp(String email, String username, String password) async {
    var res = await http.post(
        '$SERVER_IP/api/users/register',
        body: {
          "email": email,
          "username": username,
          "password": password
        }
    );
    return res;
  }

  static Future<http.Response> attemptLogin(String username, String password) async {
    var res = await http.post(
        "$SERVER_IP/api/users/login",
        body: {
          "username": username,
          "password": password
        }
    );
    return res;
  }

  static Future<bool> attemptLogout(String username) async {
    var res = await http.post(
        "$SERVER_IP/api/users/logout",
        body: {
          "username": username
        }
    );
    return res.statusCode == 200;
  }
}
