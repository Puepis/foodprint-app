import 'dart:io';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/photo_details/photo_details_page.dart';

class SelectRestaurantPage extends StatelessWidget {
  final FoodprintEntity oldFoodprint;
  final UserID userID;
  final File imageFile;
  final List<RestaurantEntity> restaurants;
  const SelectRestaurantPage(
      {Key key,
      @required this.imageFile,
      @required this.restaurants,
      @required this.userID,
      @required this.oldFoodprint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            flexibleSpace: const Center(
              child: Text(
                "Select your location!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
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
                      _buildRestaurantList(context)
                    ],
                  )
                : const Text("No restaurants found")),
      ),
    );
  }

  Widget _buildRestaurantList(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          padding: const EdgeInsets.all(20),
          shrinkWrap: true,
          itemCount: restaurants.length,
          itemBuilder: (cxt, index) => Container(
                height: 50,
                margin: const EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 20.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0)),
                  color: Colors.orange,
                  onPressed: () {
                    ExtendedNavigator.of(context).push(
                        MaterialPageRoute(
                            builder: (_) => MultiBlocProvider(
                                  providers: [
                                    BlocProvider.value(
                                        value:
                                            context.bloc<PhotoActionsBloc>()),
                                    BlocProvider.value(
                                        value: context.bloc<FoodprintBloc>())
                                  ],
                                  child: PhotoDetailsPage(
                                    oldFoodprint: oldFoodprint,
                                    userID: userID,
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
                                  fontSize: 14.0,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)),
                        ),
                      ),
                    ],
                  ),
                ),
              )),
    );
  }

  
}
