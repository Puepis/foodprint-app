
import 'dart:convert' show json, ascii, base64;
import 'package:flutter/material.dart';
import 'package:foodprint/home.dart';
import 'package:foodprint/widgets/auth/login_page.dart';
import 'package:foodprint/widgets/auth/tokens.dart';
import 'package:foodprint/widgets/authorization_portal.dart';

class TokenAuth extends StatelessWidget {
  const TokenAuth();

  static const routeName = '/';

  Future<String> get jwtOrEmpty async {
    final jwt = await storage.read(key: "jwt");
    return jwt ?? "";
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: jwtOrEmpty,
      builder: (context, snapshot) {
        // Loading
        if(!snapshot.hasData) {
          return const Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }

        // JSON Web Token
        if (snapshot.data != "") {
          final String jwtStr = snapshot.data.toString();
          final List jwtParts = jwtStr.split(".");

          if (jwtParts.length != 3) {
            return HomePage(); // invalid token
          } else {
            // Decode the payload
            final payload = json.decode(ascii.decode(base64.decode(base64.normalize(jwtParts[1].toString()))));

            // Check if token expired
            final DateTime expiry = DateTime.fromMillisecondsSinceEpoch((payload["exp"] as int) * 1000);
            if (expiry.isAfter(DateTime.now())) {
              return AuthorizationPortal(
                jwt: jwtStr,
                payload: payload as Map<String, dynamic>,
              );
            }
            else {
              // Delete expired token
              storage.delete(key: "jwt");
              return LoginPage();
            }
          }
        } else {
          return HomePage(); // No existing token
        }
      },
    );
  }
}

