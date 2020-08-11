import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/location/location_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/home/home_page.dart';
import 'package:foodprint/presentation/home/loading_page.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:foodprint/presentation/login_page/login_page.dart';
import 'package:provider/provider.dart';

/// The entry point to the app that the user sees when authenticated.
///
/// Here the user's location and foodprint are fetched, and the user is either
/// redirected to the [HomePage] or the [LoginPage], if there is an error.
class HomeScreen extends StatelessWidget {
  static const routeOnLogin = "/on_login";
  final JWT token;
  const HomeScreen({Key key, @required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) =>
                getIt<LocationBloc>()..add(LocationRequested()),
          ),
          BlocProvider<FoodprintBloc>(
              create: (context) => getIt<FoodprintBloc>()
                ..add(FoodprintEvent.foodprintRequested(token: token))),
          BlocProvider<PhotoActionsBloc>(
            create: (context) => getIt<PhotoActionsBloc>(),
          ),
        ],
        child: BlocBuilder<FoodprintBloc, FoodprintState>(
          builder: (_, state) {
            // Something went wrong server-side
            if (state is FetchFoodprintFailure) {
              return const LoginPage();
            }

            if (state is FetchFoodprintSuccess) {
              return ChangeNotifierProvider(
                create: (context) => UserData(
                  foodprint: state.foodprint,
                  token: token,
                ),
                child: const HomePage(),
              );
            }
            return LoadingPage();
          },
        ),
      ),
    );
  }
}
