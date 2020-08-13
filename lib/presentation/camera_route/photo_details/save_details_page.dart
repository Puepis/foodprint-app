import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/photo_details/save_details.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

/// The page where users fill in the details about their photo.
class SaveDetailsPage extends StatelessWidget {
  final VoidCallback onSave;
  final RestaurantEntity restaurant;
  final File imageFile;
  const SaveDetailsPage(
      {Key key,
      @required this.imageFile,
      @required this.restaurant,
      @required this.onSave})
      : assert(onSave != null),
        super(key: key);

  Color get backgroundColor => Colors.white;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: backgroundColor,
          ),
          body: Padding(
              padding: const EdgeInsets.all(20),
              child: MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                  BlocProvider.value(
                    value: context.bloc<FoodprintBloc>(),
                  )
                ],
                child: ListView(
                  shrinkWrap: true,
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
                      restaurant: restaurant,
                      onSave: onSave,
                    ),
                  ],
                ),
              ))),
    );
  }
}
