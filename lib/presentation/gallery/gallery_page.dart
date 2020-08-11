import 'package:cached_network_image/cached_network_image.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/gallery/delete/delete_confirmation_tab.dart';
import 'package:foodprint/presentation/gallery/image/image.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:provider/provider.dart';

/// Displays all of the user's photos
class Gallery extends StatelessWidget {
  final List<Tuple2<PhotoEntity, RestaurantEntity>> photos;
  const Gallery({Key key, @required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserData>();

    // Build photos lazily
    return GridView.builder(
      itemCount: photos.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        crossAxisSpacing: 5,
        mainAxisSpacing: 5,
      ),
      padding: const EdgeInsets.all(10.0),
      itemBuilder: (context, index) {
        final Tuple2<PhotoEntity, RestaurantEntity> pair = photos[index];
        final PhotoEntity photo = pair.value1;
        final RestaurantEntity restaurant = pair.value2;

        return Stack(children: [
          GestureDetector(
            onTap: () => _showFullImage(context, photo, restaurant, userData),
            child: SizedBox.expand(
              child: Card(
                color: Colors.black,
                elevation: 0.0,
                clipBehavior: Clip.antiAlias,
                child: Hero(
                  tag: photo.timestamp.getOrCrash(),
                  child: CachedNetworkImage(
                      fit: BoxFit.fitWidth,
                      fadeInDuration: const Duration(milliseconds: 150),
                      placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                      imageUrl: photo.url.getOrCrash()),
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
                  _onDeletePressed(context, photo, restaurant, userData),
            ),
          ),
        ]);
      },
    );
  }

  /// Show delete confirmation dialog
  void _onDeletePressed(BuildContext context, PhotoEntity photo,
      RestaurantEntity restaurant, UserData data) {
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
                child: ChangeNotifierProvider.value(
                  value: data,
                  child: DeleteConfirmationTab(
                    photo: photo,
                    restaurant: restaurant,
                  ),
                )));
  }

  /// Show the full image
  void _showFullImage(BuildContext context, PhotoEntity photo,
      RestaurantEntity restaurant, UserData data) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (_) => MultiProvider(
                // expose values
                providers: [
                  ChangeNotifierProvider.value(value: data),
                  BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                  BlocProvider.value(
                    value: context.bloc<FoodprintBloc>(),
                  )
                ],
                child: FullImagePage(
                  photo: photo,
                  restaurant: restaurant,
                ))));
  }
}
