import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/routes/router.gr.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';

class FoodprintApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (context) =>
                getIt<AuthBloc>()..add(const AuthEvent.authCheckRequested())) // check if user is signed in 
      ],
      child: MaterialApp(
        title: 'Foodprint',
        theme: _foodprintTheme,
        debugShowCheckedModeBanner: false,
        builder: ExtendedNavigator(router: Router()), // override default router
      ),
    );
  }
}

// Overall theme
final ThemeData _foodprintTheme = ThemeData(
  primarySwatch: Colors.deepOrange,
);
