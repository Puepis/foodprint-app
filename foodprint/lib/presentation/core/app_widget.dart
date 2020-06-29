import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/location/location_bloc.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/routes/router.gr.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
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
        builder: ExtendedNavigator(router: Router()), // override default router
      ),
    );
  }
}

// Inter, Raleway,
