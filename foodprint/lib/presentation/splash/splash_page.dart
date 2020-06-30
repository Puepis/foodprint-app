import 'package:auto_route/auto_route.dart';
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
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.map(
              initial: (_) {},

              // Logged in
              authenticated: (result) =>
                  ExtendedNavigator.of(context).push(SlideLeftRoute(
                      newPage: HomeScreen(
                token: result.token,
              ))),

              // Logged out
              unauthenticated: (_) => ExtendedNavigator.of(context)
                  .push(FadeRoute(newPage: const LoginPage())), 
            );
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
