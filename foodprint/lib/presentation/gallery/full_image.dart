import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/styles/text_styles.dart';
import 'package:intl/intl.dart';
import 'package:foodprint/presentation/common/ratings.dart';

import 'edit_image.dart';

class FullImage extends StatelessWidget {
  final FoodprintEntity foodprint;
  final RestaurantEntity restaurant;
  final PhotoEntity photo;
  const FullImage({Key key, @required this.restaurant, @required this.photo, @required this.foodprint}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString()
    );

    final Uint8List bytes = Uint8List.fromList(photo.imageData.getOrCrash());

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          final double dy = details.velocity.pixelsPerSecond.dy;
          if (dy > 0) { // swipe down
            Navigator.pop(context);
          }
          else if (dy < 0) { // swipe up
            // show photo details
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (cxt) => _photoDetails(cxt, formatter)
            );
          }
        },
       child: Center(
          child: Image.memory(bytes),
        ),
      )
    );
  }

  Widget _photoDetails(BuildContext context, NumberFormat formatter) => Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.black87
    ),
    padding: const EdgeInsets.all(20),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              photo.photoDetail.name.getOrCrash(),
              style: itemNameTextStyle
            ),
            Text(
              formatter.format(photo.photoDetail.price.getOrCrash()),
              style: subtitleTextStyle
            ),
            const Divider(
              color: Colors.grey,
              height: 30,
              thickness: 1,
            ),
            const Text(
              "TIMESTAMP",
              style: labelTextStyle,
            ),
            const SizedBox(height: 5.0),
            Text(
              photo.timestamp.getOrCrash(),
              style: largeTextStyle
            ),
            const SizedBox(height: 20),
            const Text(
              "COMMENTS",
              style: labelTextStyle,
            ),
            const SizedBox(height: 5.0,),
            Text(
              photo.photoDetail.comments.getOrCrash(),
              style: largeTextStyle
            ),
            const SizedBox(height: 20.0),
            const Text(
              "LOCATION",
              style: labelTextStyle
            ),
            const SizedBox(height: 5.0),
            Text(
              restaurant.restaurantName.getOrCrash(),
              style: subtitleTextStyle
            ),
            const SizedBox(height: 5.0,),
            restaurant.restaurantRating.getOrCrash().ratingsWidget,
            const SizedBox(height: 10.0),
            Text(
              "${restaurant.latitude}, ${restaurant.longitude}",
              style: coordsTextStyle
            )
          ],
        ),
        Positioned(
          top: 5.0,
          right: 5.0,
          child: IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.blue,
            onPressed: () {
              Navigator.push(context, MaterialPageRoute(
                builder: (context) => MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                    BlocProvider.value(value: context.bloc<FoodprintBloc>(),)
                  ],
                                  child: EditImageScreen(
                    restaurant: restaurant,
                    foodprint: foodprint,
                    photo: photo,
                  ),
                )
              ));
            },
          ),
        )
      ],
    ),
  );
}
