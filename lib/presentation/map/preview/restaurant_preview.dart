import 'package:flutter/material.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:foodprint/presentation/map/restaurant_gallery/restaurant_gallery.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'preview_photo.dart';
import 'preview_photo_description.dart';
import 'preview_swipe_indicator.dart';

class RestaurantPreview extends StatelessWidget {
  final RestaurantEntity restaurant;
  final List<PhotoEntity> photos;
  const RestaurantPreview({Key key, this.restaurant, this.photos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sort from newest to oldest
    photos.sort(
        (a, b) => b.timestamp.getOrCrash().compareTo(a.timestamp.getOrCrash()));

    return GestureDetector(
      onVerticalDragEnd: (details) {
        final double dy = details.velocity.pixelsPerSecond.dy;
        if (dy < 0) {
          // swipe up
          Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => MultiProvider(
                  providers: [
                    BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                    ChangeNotifierProvider.value(
                        value: context.read<UserData>()),
                  ],
                  child: RestaurantGallery(
                    photos: photos,
                    restaurant: restaurant,
                  ),
                ),
              ));
        }
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
            height: constraints.maxHeight * 0.68,
            decoration: BoxDecoration(
              color: foodprintPrimaryColorSwatch[50],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
            ),
            child: Column(
              children: [
                PreviewSwipeIndicator(constraints: constraints),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child:
                        LayoutBuilder(builder: (context, contentConstraints) {
                      return Row(
                        children: [
                          PreviewPhoto(
                              constraints: contentConstraints,
                              photo: photos[0]),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  restaurant.name.getOrCrash(),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                  style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20),
                                ),
                                Divider(
                                  color: Theme.of(context).primaryColor,
                                  height: 18.0,
                                  thickness: 2.0,
                                ),
                                //_buildSubheading(context),
                                // const SizedBox(
                                //   height: 16,
                                // ),
                                PreviewPhotoDescription(
                                    constraints: contentConstraints,
                                    photo: photos[0])
                              ],
                            ),
                          ),
                        ],
                      );
                    }),
                  ),
                ),
              ],
            ));
      }),
    );
  }

  Row _buildSubheading(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Icon(
              Icons.star,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(
              width: 3.0,
            ),
            Text(
              restaurant.rating.getOrCrash().toString(),
              style: const TextStyle(fontSize: 16, color: Colors.black),
            )
          ],
        ),
        Text(photos.length == 1 ? "1 Photo" : "${photos.length} Photos",
            style: const TextStyle(fontSize: 16, color: Colors.black)),
      ],
    );
  }
}
