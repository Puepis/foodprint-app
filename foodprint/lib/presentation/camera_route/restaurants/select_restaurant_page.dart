import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/photo_details/save_details.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

/// The page that displays a list of nearby [restaurants] for the user to
/// select.
///
/// If the list doesn't contain the desired restaurant, the user can use the
/// [ManualRestaurantSearchPage] to find the correct one. This widget requires
/// the [currentFoodprint], [imageFile], and user [token] to pass to
/// the [PhotoDetailsPage] for saving purposes.
class SelectRestaurantPage extends StatelessWidget {
  final FoodprintEntity currentFoodprint;
  final File imageFile;
  final List<RestaurantEntity> restaurants;
  final JWT token;
  const SelectRestaurantPage(
      {Key key,
      @required this.imageFile,
      @required this.restaurants,
      @required this.currentFoodprint,
      @required this.token})
      : super(key: key);

  // TODO: Implement manual restaurant search
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120.0),
        child: AppBar(
          backgroundColor: primaryColorDark,
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: const Center(
            child: Text(
              "Select your location!",
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
      body: Container(
          child: restaurants.isNotEmpty
              ? Column(
                  children: [
                    _buildRestaurantButtons(context),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Restaurant not listed?",
                          style: TextStyle(
                            fontSize: 16.0,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 4.0,
                        ),
                        InkWell(
                          onTap: () {},
                          child: Text(
                            "Try a manual search",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Theme.of(context).primaryColorDark,
                                fontSize: 16.0),
                          ),
                        )
                      ],
                    )
                  ],
                )
              : const Text("No restaurants found")),
    );
  }

  /// Returns the widget containing the restaurant buttons given the [context].
  Widget _buildRestaurantButtons(BuildContext context) {
    return ListView.builder(
        padding: const EdgeInsets.all(20),
        shrinkWrap: true,
        itemCount: restaurants.length,
        itemBuilder: (cxt, index) => Container(
              height: 50,
              margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
              child: RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)),
                color: Theme.of(context).primaryColorDark,
                onPressed: () {
                  Navigator.of(context).push(EnterExitRoute(
                      exitPage: this,
                      enterPage: MultiBlocProvider(
                        providers: [
                          BlocProvider.value(
                              value: context.bloc<PhotoActionsBloc>()),
                          BlocProvider.value(
                              value: context.bloc<FoodprintBloc>())
                        ],
                        child: PhotoDetailsPage(
                          oldFoodprint: currentFoodprint,
                          token: token,
                          imageFile: imageFile,
                          restaurant: restaurants[index],
                        ),
                      )));
                },
                child: Row(
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.all(5.0),
                      child:
                          const Icon(Icons.restaurant, color: Colors.white),
                    ),
                    Flexible(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 5.0),
                        child: Text(
                            restaurants[index].restaurantName.getOrCrash(),
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                                fontSize: 18.0,
                                color: Colors.white,
                                fontWeight: FontWeight.w300)),
                      ),
                    ),
                  ],
                ),
              ),
            ));
  }
}
