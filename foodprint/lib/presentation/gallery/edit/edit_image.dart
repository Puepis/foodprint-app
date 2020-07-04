import 'package:flutter/material.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(120.0),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            flexibleSpace: const Center(
              child: Text(
                "Edit the details!",
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
                BlocProvider.value(value: context.bloc<FoodprintBloc>())
              ],
              child: EditImageForm(
                  foodprint: widget.foodprint,
                  photo: widget.photo,
                  restaurant: widget.restaurant),
            )));
  }
}
