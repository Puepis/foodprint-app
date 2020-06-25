import 'package:auto_route/auto_route.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/core/value_transformers.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/gallery/full_image.dart';

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
          onTap: () => ExtendedNavigator.of(context).push(MaterialPageRoute(
              builder: (_) => MultiBlocProvider(
                      // expose values
                      providers: [
                        BlocProvider.value(
                            value: context.bloc<PhotoActionsBloc>()),
                        BlocProvider.value(
                          value: context.bloc<FoodprintBloc>(),
                        )
                      ],
                      child: FullImage(
                        foodprint: foodprint,
                        photo: photo,
                        restaurant: restaurant,
                      )))),
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
            onPressed: () {
              showModalBottomSheet(
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(5.0),
                          topLeft: Radius.circular(5.0))),
                  backgroundColor: Colors.black87,
                  context: context,
                  builder: (cxt) =>
                      _confirmationDialog(cxt, photo, restaurant));
            },
          ),
        ),
      ]);
    }).toList();
  }

  Widget _confirmationDialog(
      BuildContext context, PhotoEntity photo, RestaurantEntity restaurant) {
    final PhotoActionsBloc photoBloc = context.bloc<PhotoActionsBloc>();
    final FoodprintBloc foodprintBloc = context.bloc<FoodprintBloc>();

    return BlocListener<PhotoActionsBloc, PhotoActionsState>(
      listener: (context, state) {

        // TODO: Display snackbar
        // When deleted, rebuild widgets and return to gallery
        if (state is DeleteSuccess) {
          foodprintBloc.add(FoodprintEvent.localFoodprintUpdated(
              newFoodprint: state.newFoodprint));
          // TODO: display snackbar
          Navigator.pop(context);
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
