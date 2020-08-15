import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/register_form/register_form_bloc.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/core/styles/text_styles.dart';
import 'package:foodprint/presentation/legal/legal.dart';
import 'package:foodprint/presentation/login_page/login_page.dart';
import 'package:foodprint/presentation/register_page/register_form.dart';
import 'package:foodprint/presentation/splash/splash_page.dart';

/// The user registration page that contains the [RegisterForm].
class RegisterPage extends StatelessWidget {
  static const routeName = "/register";
  const RegisterPage({Key key}) : super(key: key);

  TextStyle get _smallTextStyle =>
      const TextStyle(fontSize: 14, color: Colors.black);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: exitApp,
      child: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
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
                  Text(
                    "Create an account",
                    style: titleTextStyle,
                  ),
                  const SizedBox(
                    height: 2.5,
                  ),
                  const Text(
                    "to begin tracking your foodprint",
                    style: TextStyle(fontSize: 20.0, color: Colors.grey),
                  ),
                  const SizedBox(
                    height: 40.0,
                  ),
                  BlocProvider(
                    create: (context) => getIt<RegisterFormBloc>(),
                    child: const RegisterForm(),
                  ),
                  const SizedBox(height: 30.0),
                  Column(
                    children: [
                      Text(
                        "By registering, you agree to our",
                        style: _smallTextStyle,
                      ),
                      const SizedBox(
                        height: 2.5,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, TermsOfService.routeName);
                            },
                            child: Text(
                              "Terms",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14.0),
                            ),
                          ),
                          Text(
                            " & ",
                            style: _smallTextStyle,
                          ),
                          InkWell(
                            onTap: () {
                              Navigator.pushNamed(
                                  context, PrivacyPolicy.routeName);
                            },
                            child: Text(
                              "Privacy Policy.",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 14.0),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const SizedBox(height: 30.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: _smallTextStyle,
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
                                  enterPage: const LoginPage()));
                        },
                        child: Text(
                          "Login.",
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
          )),
        ),
      ),
    );
  }
}
