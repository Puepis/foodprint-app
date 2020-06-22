import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/presentation/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthBloc, AuthState>(
      listener: (context, state) { // only triggers once
        state.map(
          initial: (_) {},
          authenticated: (_) {
            // TODO: Fetch user foodprint and navigate to dashboard
          },
          unauthenticated: (_) => ExtendedNavigator.of(context)
              .pushReplacementNamed(Routes.loginPage),
        );
      },
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // TODO: Create custom splash
        ),
      ),
    );
  }
}