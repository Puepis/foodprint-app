import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/login_form/login_form_bloc.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/core/styles/text_styles.dart';
import 'package:foodprint/presentation/login_page/login_form.dart';
import 'package:foodprint/presentation/register_page/register_page.dart';

/// The user login page that contains the [LoginForm].
class LoginPage extends StatelessWidget {
  static const routeName = "/login";
  static const routeOnRegisterSuccess = "/login_on_register_success";
  static const routeOnLogout = "/from_logout";
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  Align(
                    alignment: Alignment.topLeft,
                    child: Image.asset(
                      'assets/images/logo.png',
                      height: 75,
                      width: 75,
                    ),
                  ),
                  Text("Welcome back!", style: titleTextStyle),
                  const SizedBox(
                    height: 2.5,
                  ),
                  const Text(
                    "Sign in to continue",
                    style: TextStyle(fontSize: 20.0, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  BlocProvider(
                    create: (context) => getIt<LoginFormBloc>(),
                    child: const LoginForm(),
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "Don't have an account?",
                        style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        width: 4.0,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                              context,
                              EnterExitRoute(
                                  exitPage: this,
                                  enterPage: const RegisterPage()));
                        },
                        child: Text(
                          "Register.",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).primaryColor,
                              fontSize: 14.0),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
