import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/photo_details/save_details.dart';
import 'package:foodprint/presentation/camera_route/restaurants/restaurant_search_delegate.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

/// The page that displays a list of nearby [restaurants] for the user to
/// select.
///
/// If the list doesn't contain the desired restaurant, the user can use the
/// [ManualSearchPage] to find the correct one.
class SelectRestaurantPage extends StatelessWidget {
  final FoodprintEntity currentFoodprint;
  final File imageFile;
  final List<RestaurantEntity> restaurants;
  final JWT token;
  final double latitude;
  final double longitude;
  const SelectRestaurantPage(
      {Key key,
      @required this.imageFile,
      @required this.restaurants,
      @required this.currentFoodprint,
      @required this.latitude,
      @required this.longitude,
      @required this.token})
      : super(key: key);

  // ignore: avoid_field_initializers_in_const_classes
  final Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          backgroundColor: backgroundColor,
          elevation: 0.0,
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(
                Icons.search,
              ),
              onPressed: () {
                showSearch(
                    context: context,
                    delegate: RestaurantSearchDelegate(latitude, longitude));
              },
            )
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  restaurants.isEmpty
                      ? "We couldn't find any restaurants near you"
                      : "Here's what we found near you",
                  style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.bold,
                      color: primaryColor),
                ),
                const SizedBox(
                  height: 20,
                ),
                _buildRestaurantButtons(context),
              ],
            ),
          ),
        ));
  }

  /// Returns the widget containing the restaurant buttons given the [context].
  Widget _buildRestaurantButtons(BuildContext context) {
    // https://www.youtube.com/watch?v=RpQLFAFqMlw
    // TODO: Add community restaurant photo to list tile
    return ListView.separated(
        shrinkWrap: true,
        itemCount: restaurants.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (cxt, index) => ListTile(
              title: Text(restaurants[index].restaurantName.getOrCrash(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 18.0, fontWeight: FontWeight.w500)),
              subtitle: Text(
                  restaurants[index].restaurantRating.getOrCrash().toString(),
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14.0, fontWeight: FontWeight.w300)),
              leading: const Icon(
                Icons.restaurant,
                size: 30,
                color: Colors.black,
              ),
              onTap: () {
                Navigator.of(context).push(EnterExitRoute(
                    exitPage: this,
                    enterPage: MultiBlocProvider(
                      providers: [
                        BlocProvider.value(
                            value: context.bloc<PhotoActionsBloc>()),
                        BlocProvider.value(value: context.bloc<FoodprintBloc>())
                      ],
                      child: PhotoDetailsPage(
                        oldFoodprint: currentFoodprint,
                        token: token,
                        imageFile: imageFile,
                        restaurant: restaurants[index],
                      ),
                    )));
              },
            ));
  }
}
