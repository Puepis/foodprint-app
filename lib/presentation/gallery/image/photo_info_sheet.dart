import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/core/styles/text_styles.dart';
import 'package:foodprint/presentation/gallery/edit/edit_image_screen.dart';
import 'package:intl/intl.dart';
import 'package:foodprint/domain/core/value_transformers.dart';

/// Displays the photo's details
class PhotoInfoSheet extends StatelessWidget {
  const PhotoInfoSheet({
    Key key,
    @required this.token,
    @required this.photo,
    @required this.restaurant,
    @required this.foodprint,
  }) : super(key: key);

  final JWT token;
  final PhotoEntity photo;
  final RestaurantEntity restaurant;
  final FoodprintEntity foodprint;

  @override
  Widget build(BuildContext context) {
    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return Container(
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(20.0),
            topRight: Radius.circular(20.0),
          ),
          color: Colors.black87),
      padding: const EdgeInsets.all(20),
      child: Stack(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(photo.photoDetail.name.getOrCrash(),
                  style: itemNameTextStyle),
              const SizedBox(
                height: 5.0,
              ),
              Text(formatter.format(photo.photoDetail.price.getOrCrash()),
                  style: priceText),
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
              Text(photo.timestamp.toReadable(), style: largeTextStyle),
              const SizedBox(height: 20),
              const Text(
                "COMMENTS",
                style: labelTextStyle,
              ),
              const SizedBox(
                height: 5.0,
              ),
              Text(photo.photoDetail.comments.getOrCrash(),
                  style: largeTextStyle),
              const SizedBox(height: 20.0),
              const Text("LOCATION", style: labelTextStyle),
              const SizedBox(height: 5.0),
              Text(restaurant.restaurantName.getOrCrash(),
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                  style: restaurantName),
              const SizedBox(
                height: 5.0,
              ),
              Row(
                children: [
                  Icon(
                    Icons.star,
                    color: Theme.of(context).primaryColor,
                  ),
                  const SizedBox(
                    width: 5.0,
                  ),
                  Text(
                    restaurant.restaurantRating.getOrCrash().toString(),
                    style: const TextStyle(fontSize: 18.0, color: Colors.grey),
                  )
                ],
              ),
              const SizedBox(height: 10.0),
              Text(
                  "${restaurant.latitude.getOrCrash()}, ${restaurant.longitude.getOrCrash()}",
                  style: coordsTextStyle)
            ],
          ),
          Positioned(
            top: 5.0,
            right: 5.0,
            child: IconButton(
              icon: const Icon(Icons.edit),
              color: Theme.of(context).primaryColor,
              onPressed: () {
                Navigator.of(context).push(SlideUpEnterRoute(
                    newPage: MultiBlocProvider(
                  providers: [
                    BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                    BlocProvider.value(
                      value: context.bloc<FoodprintBloc>(),
                    )
                  ],
                  child: EditImageScreen(
                    token: token,
                    restaurant: restaurant,
                    foodprint: foodprint,
                    photo: photo,
                  ),
                )));
              },
            ),
          )
        ],
      ),
    );
  }
}