import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

class DeleteConfirmationTab extends StatelessWidget {
  const DeleteConfirmationTab({
    Key key,
    @required this.photo,
    @required this.restaurant,
    @required this.foodprint,
  }) : super(key: key);

  final PhotoEntity photo;
  final RestaurantEntity restaurant;
  final FoodprintEntity foodprint;

  @override
  Widget build(BuildContext context) {
    final PhotoActionsBloc photoBloc = context.bloc<PhotoActionsBloc>();
    final FoodprintBloc foodprintBloc = context.bloc<FoodprintBloc>();

    return BlocListener<PhotoActionsBloc, PhotoActionsState>(
      listener: (context, state) {
        // When deleted, rebuild widgets and return to gallery
        if (state is DeleteSuccess) {
          Navigator.pop(context);
          print("Photo deleted, firing event");
          foodprintBloc.add(FoodprintEvent.localFoodprintUpdated(
              newFoodprint: state.newFoodprint));
        }
      },
      child: Container(
        padding: const EdgeInsets.only(bottom: 5.0),
        child: Wrap(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 5.0),
              child: const Text(
                "Are you sure you want to delete this photo?",
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 14.0, color: Colors.white70),
              ),
            ),
            ListTile(
              leading: const Icon(
                Icons.delete_outline,
                color: Colors.white70,
              ),
              title: const Text(
                "Delete photo",
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                // Delete photo
                photoBloc.add(PhotoActionsEvent.deleted(
                    photo: photo,
                    restaurant: restaurant,
                    foodprint: foodprint));
              },
            )
          ],
        ),
      ),
    );
  }
}
