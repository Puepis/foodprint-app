import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/account/account_bloc.dart';
import 'package:foodprint/application/restaurants/manual_search/manual_search_bloc.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/presentation/home/drawer/drawer.dart';
import 'package:foodprint/presentation/legal/legal.dart';
import 'package:foodprint/presentation/login_page/login_page.dart';
import 'package:foodprint/presentation/register_page/register_page.dart';
import 'package:foodprint/presentation/router/route_generator.dart';
import 'package:foodprint/presentation/splash/splash_page.dart';
import 'package:google_fonts/google_fonts.dart';

/// The entry point for the Foodprint application.
class FoodprintApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => getIt<AccountBloc>(),
          ),
          BlocProvider(
              create: (context) => getIt<AuthBloc>()
                ..add(const AuthEvent
                    .authCheckStarted())), // check if user is signed in
          BlocProvider(
            lazy: false,
            create: (context) => getIt<ManualSearchBloc>(),
          )
        ],
        child: MaterialApp(
          title: 'Foodprint',
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              iconTheme:
                  Theme.of(context).iconTheme.copyWith(color: Colors.white),
              color: foodprintPrimaryColorSwatch[500],
              textTheme: Theme.of(context).textTheme.copyWith(
                  headline6: GoogleFonts.rubik(
                      color: Colors.white,
                      fontSize: 22,
                      fontWeight: FontWeight.w500)),
            ),
            primaryColor: primaryColor,
            primaryColorDark: primaryColorDark,
            primarySwatch: primarySwatch,
            secondaryHeaderColor: secondaryColor,
            errorColor: errorColor,
            hintColor: hintColor,
            hoverColor: hoverColor,
            backgroundColor: Colors.white,
            textTheme: GoogleFonts.rubikTextTheme(textTheme),
          ),
          debugShowCheckedModeBanner: false,
          initialRoute: SplashPage.routeName,
          routes: {
            SplashPage.routeName: (context) => SplashPage(),
            LoginPage.routeName: (context) => const LoginPage(),
            RegisterPage.routeName: (context) => const RegisterPage(),
            ReportIssuePage.routeName: (context) => const ReportIssuePage(),
            LegalPage.routeName: (context) => const LegalPage(),
          },
          onGenerateRoute: RouteGenerator.generateRoute,
        ));
  }
}
