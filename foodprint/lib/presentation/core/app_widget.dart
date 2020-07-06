import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/location/location_bloc.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/presentation/login_page/login_page.dart';
import 'package:foodprint/presentation/register_page/register_page.dart';
import 'package:foodprint/presentation/splash/splash_page.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodprintApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) => getIt<AuthBloc>()
              ..add(const AuthEvent
                  .authCheckStarted())), // check if user is signed in
        BlocProvider(
          create: (context) => getIt<LocationBloc>()..add(LocationRequested()),
        )
      ],
      child: MaterialApp(
        title: 'Foodprint',
        theme: ThemeData(
            brightness: Brightness.light,
            primaryColor: primaryColor,
            primaryColorDark: primaryColorDark,
            primarySwatch: primarySwatch,
            secondaryHeaderColor: secondaryColor,
            errorColor: errorColor,
            hintColor: hintColor,
            hoverColor: hoverColor,
            backgroundColor: bgColor,
            textTheme: GoogleFonts.rubikTextTheme(textTheme),
        ),
        debugShowCheckedModeBanner: false,
        home: const LoginPage(),
        initialRoute: SplashPage.routeName,
        routes: {
          SplashPage.routeName: (context) => SplashPage(),
          LoginPage.routeName: (context) => const LoginPage(),
          RegisterPage.routeName: (context) => const RegisterPage(),
        },
      ),
    );
  }
}

// Inter, Raleway,
