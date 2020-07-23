import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/presentation/common/buttons.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/home/settings/change_password_page.dart';
import 'package:foodprint/presentation/home/settings/change_username_page.dart';
import 'package:foodprint/presentation/router/update_account_args.dart';

class SettingsPage extends StatelessWidget {
  final JWT token;
  static const String routeName = "/settings";
  const SettingsPage({Key key, @required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final username =
        JWT.getDecodedPayload(token.getOrCrash())['username'] as String;

    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text("Settings"),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(20, 40, 20, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Text(
                  "Account",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Username",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0)),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                onTap: () => Navigator.pushNamed(
                    context, ChangeUsernamePage.routeName,
                    arguments: ChangeUsernameArgs(token)),
                  enabled: true,
                  initialValue: username,
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                const Text("Password",
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w500,
                        fontSize: 16.0)),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  enabled: true,
                  initialValue: '********',
                  cursorColor: primaryColor,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(7.0)),
                  ),
                  onTap: () => Navigator.pushNamed(
                      context, ChangePasswordPage.routeName,
                      arguments: ChangePasswordArgs(token)),
                ),
                const SizedBox(
                  height: 30,
                ),
                AuthIdleButton(
                    title: "Sign Out",
                    onPressed: () =>
                        context.bloc<AuthBloc>().add(const LoggedOut())),
                const SizedBox(
                  height: 15,
                ),
                FlatButton(
                  onPressed: () {}, // TODO: delete account
                  child: const Text(
                    "Delete Account",
                    style: TextStyle(color: Colors.grey, fontSize: 14.0),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      "version 1.0.0",
                      style: TextStyle(color: Colors.grey, fontSize: 14.0),
                    ),
                  ],
                )
              ],
            ),
          ),
        ));
  }
}
