import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/presentation/routes/router.gr.dart';

class SplashPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocListener(
      listeners: [
        BlocListener<AuthBloc, AuthState>(
          listener: (context, state) {
            state.map(
              initial: (_) {},
              authenticated: (result) => ExtendedNavigator.of(context)
                  .pushNamed(Routes.homeScreen,
                      arguments: HomeScreenArguments(token: result.token)),
              unauthenticated: (_) =>
                  ExtendedNavigator.of(context).pushNamed(Routes.loginPage),
            );
          },
        ),
      ],
      child: const Scaffold(
        body: Center(
          child: CircularProgressIndicator(), // TODO: Create custom splash
        ),
      ),
    );
  }
}
