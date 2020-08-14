import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/presentation/camera_route/photo_details/save_details.dart';
import 'package:foodprint/presentation/camera_route/restaurants/restaurants.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:foodprint/presentation/router/camera/save_details_args.dart';
import 'package:foodprint/presentation/router/camera/select_restaurant_args.dart';
import 'package:provider/provider.dart';

import 'camera/foodprint_capture.dart';

class CameraNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  CameraNavigator({Key key}) : super(key: key);

  @override
  _CameraNavigatorState createState() => _CameraNavigatorState();
}

class _CameraNavigatorState extends State<CameraNavigator> {
  Future<bool> didPopRoute() async {
    final NavigatorState navigator = widget.navigatorKey.currentState;
    assert(navigator != null);
    return navigator.maybePop();
  }

  void onCancelRoute() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await didPopRoute();
      },
      child: Navigator(
        key: widget.navigatorKey,
        initialRoute: FoodprintCapture.routeName,
        onGenerateRoute: (settings) {
          final args = settings.arguments;
          switch (settings.name) {
            case FoodprintCapture.routeName:
              return MaterialPageRoute(
                  builder: (_) => FoodprintCapture(
                        onDismiss: onCancelRoute,
                      ));
              break;
            case SelectRestaurantPage.routeName:
              if (args is SelectRestaurantArgs) {
                return SlideLeftRoute(
                    newPage: MultiProvider(
                  providers: [
                    ChangeNotifierProvider.value(
                        value: context.read<UserData>()),
                    BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                    BlocProvider.value(value: context.bloc<FoodprintBloc>())
                  ],
                  child: SelectRestaurantPage(
                      latitude: args.latitude,
                      longitude: args.longitude,
                      imageFile: args.imageFile,
                      restaurants: args.restaurants),
                ));
              }
              throw Exception('Invalid route: ${settings.name}');
            case SaveDetailsPage.routeName:
              if (args is SaveDetailsArgs) {
                return SlideLeftRoute(
                    newPage: MultiProvider(
                  providers: [
                    ChangeNotifierProvider.value(
                        value: context.read<UserData>()),
                    BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                    BlocProvider.value(value: context.bloc<FoodprintBloc>())
                  ],
                  child: SaveDetailsPage(
                    onSave: onCancelRoute,
                    imageFile: args.imageFile,
                    restaurant: args.restaurant,
                  ),
                ));
              }

              throw Exception('Invalid route: ${settings.name}');
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
        },
      ),
    );
  }
}
