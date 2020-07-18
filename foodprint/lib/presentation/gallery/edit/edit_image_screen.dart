import 'package:flutter/material.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/gallery/edit/edit_image_form.dart';

class EditImageScreen extends StatefulWidget {
  final FoodprintEntity foodprint;
  final PhotoEntity photo;
  final RestaurantEntity restaurant;
  const EditImageScreen(
      {Key key,
      @required this.photo,
      @required this.foodprint,
      @required this.restaurant})
      : super(key: key);
  @override
  _EditImageScreenState createState() => _EditImageScreenState();
}

class _EditImageScreenState extends State<EditImageScreen> {

  static Color backgroundColor = foodprintPrimaryColorSwatch[50];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
        appBar: AppBar(
         elevation: 0.0, 
         backgroundColor: backgroundColor,
        ),
        body: Container(
            padding: const EdgeInsets.all(20),
            child: MultiBlocProvider(
              providers: [
                BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                BlocProvider.value(value: context.bloc<FoodprintBloc>())
              ],
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Edit the details!",
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 35.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    EditImageForm(
                        foodprint: widget.foodprint,
                        photo: widget.photo,
                        restaurant: widget.restaurant),
                  ],
                ),
              ),
            )));
  }
}
