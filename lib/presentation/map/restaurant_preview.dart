import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/map/restaurant_gallery/restaurant_gallery.dart';
import 'package:foodprint/presentation/router/restaurant_gallery_args.dart';
import 'package:transparent_image/transparent_image.dart';

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
          Navigator.pushNamed(context, RestaurantGallery.routeName,
              arguments: RestaurantGalleryArgs(
                  photos: photos, restaurant: restaurant));
        }
      },
      child: LayoutBuilder(builder: (context, constraints) {
        return Container(
            height: 200,
            decoration: BoxDecoration(
              color: foodprintPrimaryColorSwatch[50],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
            ),
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                _buildRecentPhoto(constraints),
                const SizedBox(
                  width: 5.0,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(5.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
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
                          height: 16.0,
                          thickness: 2.0,
                        ),
                        Expanded(
                          child: Text(photos.length == 1
                              ? "You've taken one photo here!"
                              : "You've taken ${photos.length} photos here!"),
                        ),
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
                              style: const TextStyle(
                                  fontSize: 16, color: Colors.black),
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ));
      }),
    );
  }

  Widget _buildRecentPhoto(BoxConstraints constraints) => ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Container(
          color: Colors.black,
          height: double.infinity,
          width: constraints.maxWidth * 0.3,
          child: Hero(
            tag: photos[0].url.getOrCrash(),
            child: CachedNetworkImage(
                fit: BoxFit.fitWidth,
                fadeInDuration: const Duration(milliseconds: 150),
                placeholder: (context, url) => Image.memory(kTransparentImage),
                imageUrl: photos[0].url.getOrCrash()),
          ),
        ),
      );
}
