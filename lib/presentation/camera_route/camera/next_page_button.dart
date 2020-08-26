import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/restaurants/select_restaurant_page.dart';
import 'package:foodprint/presentation/core/styles/gradients.dart';
import 'package:foodprint/presentation/data/user_location.dart';
import 'package:foodprint/presentation/router/camera/select_restaurant_args.dart';
import 'package:foodprint/presentation/walkthrough/walkthrough_model.dart';
import 'package:provider/provider.dart';

/// The button that brings the user to the restaurant selection page.
///
/// Passes the list of [restaurants] to the next page.
class NextPageButton extends StatelessWidget {
  final File imageFile;
  const NextPageButton({
    Key key,
    @required this.restaurants,
    @required this.imageFile,
  }) : super(key: key);

  final List<RestaurantEntity> restaurants;

  @override
  Widget build(BuildContext context) {
    final location = context.watch<UserLocation>();
    final walkthrough = context.watch<WalkthroughModel>();

    return Container(
      width: 60,
      height: 60,
      child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: LinearGradient(
                    begin: Alignment.bottomLeft,
                    end: Alignment.topRight,
                    colors: sweetMorningGradient)),
            child: InkWell(
              borderRadius: BorderRadius.circular(1000.0),
              onTap: () {
                // Move to next walkthrough screen
                if (walkthrough.screen == 5) {
                  walkthrough.next();
                }
                Navigator.of(context).pushNamed(SelectRestaurantPage.routeName,
                    arguments: SelectRestaurantArgs(imageFile, restaurants,
                        location.latitude, location.longitude));
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
