import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/home/home_screen.dart';
import 'package:foodprint/presentation/login_page/login_page.dart';

/*
  This class listens for the authentication state and routes accordingly
*/
class SplashPage extends StatelessWidget {
  static const routeName = "/splash";
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (cxt, state) {
            state.map(
                initial: (_) {},

                // Logged in
                authenticated: (result) {
                  Navigator.pushAndRemoveUntil(
                      cxt,
                      SlideLeftRoute(
                          newPage: HomeScreen(
                        token: result.token,
                      )),
                      ModalRoute.withName(SplashPage.routeName));
                },

                // Logged out
                unauthenticated: (_) {
                  Navigator.pushAndRemoveUntil(
                      cxt,
                      FadeRoute(newPage: const LoginPage()),
                      ModalRoute.withName(SplashPage.routeName));
                });
          },
        ),
      ],
      child: Scaffold(
        body: Center(
          child: Image.asset(
            'assets/images/logo.png',
            height: 200,
            width: 300,
          ),
        ),
      ),
    );
  }
}
