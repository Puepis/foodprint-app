import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera/restaurant_listing.dart';

class NextPageButton extends StatelessWidget {
  const NextPageButton({
    Key key,
    @required this.restaurants,
    @required this.imageFile,
    @required this.userID,
    @required this.oldFoodprint,
  }) : super(key: key);

  final File imageFile;
  final List<RestaurantEntity> restaurants;
  final FoodprintEntity oldFoodprint;
  final UserID userID;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: const BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(1000.0),
              onTap: () {
                ExtendedNavigator.of(context).push(MaterialPageRoute(
                    builder: (context) => MultiBlocProvider(
                          providers: [
                            BlocProvider.value(
                                value: context.bloc<PhotoActionsBloc>()),
                            BlocProvider.value(
                                value: context.bloc<FoodprintBloc>())
                          ],
                          child: RestaurantListing(
                              oldFoodprint: oldFoodprint,
                              userID: userID,
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
