import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/photo_details/save_details.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

class PhotoDetailsPage extends StatelessWidget {
  final RestaurantEntity restaurant;
  final File imageFile;
  final FoodprintEntity oldFoodprint;
  final JWT token;
  const PhotoDetailsPage(
      {Key key,
      @required this.imageFile,
      @required this.restaurant,
      @required this.oldFoodprint,
      @required this.token})
      : super(key: key);

  static Color backgroundColor = foodprintPrimaryColorSwatch[50];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: backgroundColor,
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                BlocProvider.value(
                  value: context.bloc<FoodprintBloc>(),
                )
              ],
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Fill in the details!",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    SaveDetailsForm(
                      imageFile: imageFile,
                      oldFoodprint: oldFoodprint,
                      restaurant: restaurant,
                      token: token,
                    ),
                  ],
                ),
              ),
            )));
  }
}
