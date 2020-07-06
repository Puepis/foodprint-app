import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/core/value_transformers.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/gallery/delete/delete_confirmation_tab.dart';
import 'package:foodprint/presentation/gallery/image/image.dart';

// Displays all the photos
class Gallery extends StatelessWidget {
  final FoodprintEntity foodprint;

  const Gallery({Key key, @required this.foodprint}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // columns
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.all(10.0),
      children: _buildPhotos(context),
    );
  }

  // TODO: Use animation to display photos sequentially
  List<Widget> _buildPhotos(BuildContext context) {
    final List<Tuple2<PhotoEntity, RestaurantEntity>> photos =
        getPhotosFromFoodprint(foodprint);

    // No photos yet
    if (photos == null || photos.isEmpty) {
      return const <Card>[];
    }

    // Sort from newest to oldest
    photos.sort((a, b) => b.value1.timestamp
        .getOrCrash()
        .compareTo(a.value1.timestamp.getOrCrash()));

    // Render photos
    return photos.map((pair) {
      final PhotoEntity photo = pair.value1;
      final RestaurantEntity restaurant = pair.value2;

      return Stack(children: [
        GestureDetector(
          onTap: () => _showFullImage(context, photo, restaurant),
          child: Card(
            elevation: 0.0,
            clipBehavior: Clip.antiAlias,
            child: Container(
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: MemoryImage(photo.bytes), fit: BoxFit.cover)),
            ),
          ),
        ),
        Positioned(
          top: 2.5,
          right: 2.5,
          child: IconButton(
            icon: const Icon(Icons.delete),
            iconSize: 25.0,
            color: Colors.white,
            onPressed: () => _onDeletePressed(context, photo, restaurant),
          ),
        ),
      ]);
    }).toList();
  }

  // Show delete confirmation dialog
  void _onDeletePressed(
      BuildContext context, PhotoEntity photo, RestaurantEntity restaurant) {
    showModalBottomSheet(
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topRight: Radius.circular(5.0), topLeft: Radius.circular(5.0))),
        backgroundColor: Colors.black87,
        context: context,
        builder: (_) => MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                  BlocProvider.value(value: context.bloc<FoodprintBloc>()),
                ],
                child: DeleteConfirmationTab(
                    photo: photo,
                    restaurant: restaurant,
                    foodprint: foodprint)));
  }

  void _showFullImage(
      BuildContext context, PhotoEntity photo, RestaurantEntity restaurant) {
        // TODO: change transition to arc transition
    Navigator.of(context).push(SlideUpEnterRoute(
        newPage: MultiBlocProvider(
            // expose values
            providers: [
          BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
          BlocProvider.value(
            value: context.bloc<FoodprintBloc>(),
          )
        ],
            child: FullImage(
              foodprint: foodprint,
              photo: photo,
              restaurant: restaurant,
            ))));
  }
}
