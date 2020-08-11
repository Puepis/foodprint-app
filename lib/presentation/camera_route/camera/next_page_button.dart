import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/restaurants/select_restaurant_page.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/data/user_location.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:provider/provider.dart';

/// The button that brings the user to the restaurant selection page.
///
/// Passes the list of [restaurants] to the next page.
class NextPageButton extends StatelessWidget {
  final File imageFile;
  final VoidCallback onSave;
  const NextPageButton({
    Key key,
    @required this.restaurants,
    @required this.imageFile,
    @required this.onSave,
  })  : assert(onSave != null),
        super(key: key);

  final List<RestaurantEntity> restaurants;

  @override
  Widget build(BuildContext context) {
    final location = context.watch<UserLocation>();

    return Container(
      width: 60,
      height: 60,
      child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(1000.0),
              onTap: () {
                // Move to "choose your restaurant" page
                Navigator.of(context).push(SlideLeftRoute(
                    newPage: MultiProvider(
                  providers: [
                    ChangeNotifierProvider.value(
                        value: context.read<UserData>()),
                    BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                    BlocProvider.value(value: context.bloc<FoodprintBloc>())
                  ],
                  child: SelectRestaurantPage(
                      onSave: onSave,
                      latitude: location.latitude,
                      longitude: location.longitude,
                      imageFile: imageFile,
                      restaurants: restaurants),
                )));
              },
              child: const Icon(
                Icons.navigate_next,
                size: 50.0,
                color: Colors.white,
              ),
            ),
          )),
    );
  }
}
