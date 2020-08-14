import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:foodprint/presentation/gallery/edit/edit.dart';
import 'package:provider/provider.dart';

import 'full_image.dart';

class FullImageNavigator extends StatefulWidget {
  final PhotoEntity photo;
  final RestaurantEntity restaurant;
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  FullImageNavigator({Key key, this.photo, this.restaurant}) : super(key: key);

  @override
  _FullImageNavigatorState createState() => _FullImageNavigatorState();
}

class _FullImageNavigatorState extends State<FullImageNavigator> {
  Future<bool> didPopRoute() async {
    final NavigatorState navigator = widget.navigatorKey.currentState;
    assert(navigator != null);
    return navigator.maybePop();
  }

  void onCancelRoute() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    // A nested navigator representing the "edit image" journey.
    return WillPopScope(
      onWillPop: () async {
        return !await didPopRoute();
      },
      child: Navigator(
        key: widget.navigatorKey,
        initialRoute: FullImage.routeName,
        onGenerateRoute: (settings) {
          final args = settings.arguments;
          WidgetBuilder builder;
          switch (settings.name) {
            case FullImage.routeName:
              builder = (_) => FullImage(
                    restaurant: widget.restaurant,
                    photo: widget.photo,
                  );
              break;
            case EditImagePage.routeName:
              if (args is PhotoEntity) {
                return SlideUpEnterRoute(
                    newPage: MultiProvider(
                        providers: [
                      ChangeNotifierProvider.value(
                        value: context.read<UserData>(),
                      ),
                      BlocProvider.value(
                          value: context.bloc<PhotoActionsBloc>()),
                      BlocProvider.value(
                        value: context.bloc<FoodprintBloc>(),
                      )
                    ],
                        child: EditImagePage(
                          restaurant: widget.restaurant,
                          photo: args,
                          onEdit: onCancelRoute,
                        )));
              }
              throw Exception('Invalid route: ${settings.name}');
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}
