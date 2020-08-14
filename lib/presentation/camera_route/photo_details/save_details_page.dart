import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/photo_details/save_details.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

/// The page where users fill in the details about their photo.
class SaveDetailsPage extends StatelessWidget {
  final VoidCallback onSave;
  final RestaurantEntity restaurant;
  final File imageFile;
  static const routeName = "save_details/";
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
            leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pop(context)),
            elevation: 0,
            backgroundColor: backgroundColor,
          ),
          body: Padding(
              padding: const EdgeInsets.all(20),
              child: ListView(
                shrinkWrap: true,
                children: [
                  Text(
                    "Fill in the details!",
                    style: TextStyle(
                        color: primaryColorDark,
                        fontSize: 35.0,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 2.5,
                  ),
                  const Text(
                    "Record your dining experience",
                    style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                        color: Colors.grey),
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
              ))),
    );
  }
}
