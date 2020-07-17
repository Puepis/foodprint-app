import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/home/home_screen.dart';
import 'package:foodprint/presentation/login_page/login_page.dart';

/// The initial page that determines which page to show depending on the
/// authentication state.
///
/// If the user is not authenticated, they are redirected to the [LoginPage],
/// otherwise they are shown the [HomePage].
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
                      FadeRoute(
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
      child: const Scaffold(
        backgroundColor: Colors.white,
      ),
    );
  }
}
