import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/home/home_page.dart';
import 'package:foodprint/presentation/home/loading_page.dart';
import 'package:foodprint/presentation/login_page/login_page.dart';

class HomeScreen extends StatelessWidget {
  final JWT token;
  const HomeScreen({Key key, @required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider<FoodprintBloc>(
              create: (context) => getIt<FoodprintBloc>()
                ..add(FoodprintEvent.foodprintRequested(token: token))),
          BlocProvider<PhotoActionsBloc>(
            create: (context) => getIt<PhotoActionsBloc>(),
          ),
        ],
        child: BlocBuilder<FoodprintBloc, FoodprintState>(
          builder: (context, state) {

            print("Rebuilding home screen");

            if (state is FetchFoodprintFailure) {
              // TODO: Check failure type
              return const LoginPage();
            }
            if (state is FoodprintUpdated) {
              return HomePage(
                foodprint: state.foodprint,
                token: token,
              );
            }
            if (state is FetchFoodprintSuccess) {
              // TODO: Add animation to make this transition smoother
              return HomePage(
                foodprint: state.foodprint,
                token: token,
              );
            }
            return LoadingPage();
          },
        ),
      ),
    );
  }
}
