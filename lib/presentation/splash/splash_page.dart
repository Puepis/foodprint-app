import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/presentation/home/home_screen.dart';
import 'package:foodprint/presentation/login_page/login_page.dart';
import 'package:foodprint/presentation/onboarding/onboarding_page.dart';
import 'package:foodprint/presentation/router/home_screen_args.dart';

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
                loading: (_) {},

                // Logged in
                authenticated: (result) {
                  Navigator.pushNamedAndRemoveUntil(
                      cxt,
                      HomeScreen.routeOnLogin,
                      ModalRoute.withName(SplashPage.routeName),
                      arguments: HomeScreenArgs(
                          token: result.token, firstLogin: result.firstLogin));
                },

                // Logged out
                unauthenticated: (_) {
                  Navigator.pushNamedAndRemoveUntil(
                      cxt,
                      LoginPage.routeOnLogout,
                      ModalRoute.withName(SplashPage.routeName));
                },
                firstAppLaunch: (_) {
                  Navigator.pushNamed(context, OnboardingScreen.routeName);
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

Future<bool> exitApp() async {
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  return false;
}
