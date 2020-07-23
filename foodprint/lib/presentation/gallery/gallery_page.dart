import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/core/value_transformers.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/gallery/delete/delete_confirmation_tab.dart';
import 'package:foodprint/presentation/gallery/image/image.dart';
import 'package:foodprint/presentation/inherited_widgets/inherited_user.dart';

/// Displays all of the user's photos 
class Gallery extends StatelessWidget {
  final JWT token;
  const Gallery({Key key, @required this.token}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final foodprint = InheritedUser.of(context).foodprint;

    // Photos
    final List<Tuple2<PhotoEntity, RestaurantEntity>> photos =
        getPhotosFromFoodprint(foodprint);

    // Sort from newest to oldest
    photos.sort((a, b) => b.value1.timestamp
        .getOrCrash()
        .compareTo(a.value1.timestamp.getOrCrash()));

    // Build photos lazily
    return GridView.builder(
      itemCount: photos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 10,
      ),
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, index) {
        final Tuple2<PhotoEntity, RestaurantEntity> pair = photos[index];
        final PhotoEntity photo = pair.value1;
        final RestaurantEntity restaurant = pair.value2;

        return Stack(children: [
          GestureDetector(
            onTap: () => _showFullImage(context, photo, restaurant, foodprint),
            child: Card(
              elevation: 0.0,
              clipBehavior: Clip.antiAlias,
              child: Hero(
                tag: photo.timestamp.getOrCrash(),
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(photo.url.getOrCrash()),
                          fit: BoxFit.cover)),
                ),
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
              onPressed: () =>
                  _onDeletePressed(context, photo, restaurant, foodprint),
            ),
          ),
        ]);
      },
    );
  }

  /// Show delete confirmation dialog
  void _onDeletePressed(BuildContext context, PhotoEntity photo,
      RestaurantEntity restaurant, FoodprintEntity foodprint) {
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

  /// Show the full image 
  void _showFullImage(BuildContext context, PhotoEntity photo,
      RestaurantEntity restaurant, FoodprintEntity foodprint) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => MultiBlocProvider(
                // expose values
                providers: [
                  BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                  BlocProvider.value(
                    value: context.bloc<FoodprintBloc>(),
                  )
                ],
                child: FullImage(
                  token: token,
                  foodprint: foodprint,
                  photo: photo,
                  restaurant: restaurant,
                ))));
  }
}
