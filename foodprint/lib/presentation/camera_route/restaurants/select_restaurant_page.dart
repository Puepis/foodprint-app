import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/photo_details/save_details.dart';
import 'package:foodprint/presentation/camera_route/restaurants/manual_search_page.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

/// The page that displays a list of nearby [restaurants] for the user to
/// select.
///
/// If the list doesn't contain the desired restaurant, the user can use the
/// [ManualSearchPage] to find the correct one. This widget requires
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

  @override
  Widget build(BuildContext context) {
    if (restaurants.isNotEmpty) {
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
          body: Column(
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
                    onTap: () async {
                      final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ManualSearchPage()));
                    },
                    child: Text(
                      "Try a manual search",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColorDark,
                          fontSize: 16.0),
                    ),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 15, bottom: 15),
                child: Row(
                  children: const [
                    Expanded(
                      child: Divider(
                        thickness: 1,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Text(
                      "or",
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    ),
                    SizedBox(
                      width: 10.0,
                    ),
                    Expanded(
                        child: Divider(
                      thickness: 1,
                      color: Colors.white,
                    )),
                  ],
                ),
              ),
              FloatingActionButton.extended(
                  backgroundColor: primaryColorDark,
                  onPressed: () {
                    int count = 0;
                    Navigator.popUntil(context, (route) => count++ == 2);
                  },
                  label: Text("Cancel"))
            ],
          ));
    }
    return NoRestaurantsPage();
  }

  /// Returns the widget containing the restaurant buttons given the [context].
  Widget _buildRestaurantButtons(BuildContext context) {
    return ListView.separated(
        padding: const EdgeInsets.all(15),
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
              leading: Icon(
                Icons.restaurant,
                size: 30,
                color: primaryColor,
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

/// The page that is displayed when no nearby restaurants are found
///
class NoRestaurantsPage extends StatelessWidget {
  const NoRestaurantsPage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sorry, we couldn't find any restaurants near you.",
              style: TextStyle(
                  fontSize: 50.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
            const SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () async {
                final result = await Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => ManualSearchPage()));
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.search,
                    color: Colors.black,
                    size: 40,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Try a manual search",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30.0),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, bottom: 15),
              child: Row(
                children: const [
                  Expanded(
                    child: Divider(
                      thickness: 1,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Text(
                    "or",
                    style: TextStyle(color: Colors.white, fontSize: 30.0),
                  ),
                  SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                      flex: 2,
                      child: Divider(
                        thickness: 1,
                        color: Colors.white,
                      )),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                int count = 0;
                Navigator.popUntil(context, (route) => count++ == 2);
              },
              child: Row(
                children: const [
                  Icon(
                    Icons.arrow_back,
                    color: Colors.black,
                    size: 40,
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  Text(
                    "Return Home",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30.0),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
