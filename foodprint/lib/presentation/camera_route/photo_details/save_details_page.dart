import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/photo_details/save_details.dart';

class PhotoDetailsPage extends StatelessWidget {
  final UserID userID;
  final RestaurantEntity restaurant;
  final File imageFile;
  final FoodprintEntity oldFoodprint;
  const PhotoDetailsPage(
      {Key key,
      @required this.imageFile,
      @required this.restaurant,
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
                  "Fill in the details!",
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
              margin: const EdgeInsets.fromLTRB(7.5, 10.0, 7.5, 0),
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                  BlocProvider.value(
                    value: context.bloc<FoodprintBloc>(),
                  )
                ],
                child: SaveDetailsForm(
                  imageFile: imageFile,
                  oldFoodprint: oldFoodprint,
                  restaurant: restaurant,
                  userID: userID,
                ),
              ))),
    );
  }
}
