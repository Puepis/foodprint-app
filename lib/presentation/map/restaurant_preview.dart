import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:foodprint/presentation/map/restaurant_gallery/restaurant_gallery.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

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
            height: constraints.maxHeight * 0.65,
            decoration: BoxDecoration(
              color: foodprintPrimaryColorSwatch[50],
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10.0),
                  topRight: Radius.circular(10.0)),
            ),
            child: Column(
              children: [
                _buildSwipeIndicator(constraints),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.fromLTRB(20, 10, 20, 20),
                    child: Row(
                      children: [
                        _buildPhoto(constraints, photos[0]),
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
                                textAlign: TextAlign.center,
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
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: [
                              //     Row(
                              //       children: [
                              //         Icon(
                              //           Icons.star,
                              //           color: Theme.of(context).primaryColor,
                              //         ),
                              //         const SizedBox(
                              //           width: 3.0,
                              //         ),
                              //         Text(
                              //           restaurant.rating
                              //               .getOrCrash()
                              //               .toString(),
                              //           style: const TextStyle(
                              //               fontSize: 16, color: Colors.black),
                              //         )
                              //       ],
                              //     ),
                              //     Text(
                              //         photos.length == 1
                              //             ? "1 Photo"
                              //             : "${photos.length} Photos",
                              //         style: const TextStyle(
                              //             fontSize: 16, color: Colors.black)),
                              //   ],
                              // ),
                              _buildPhotoDescription(
                                  constraints, photos[0], formatter)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ));
      }),
    );
  }

  Container _buildSwipeIndicator(BoxConstraints constraints) {
    return Container(
      decoration: BoxDecoration(
          color: foodprintPrimaryColorSwatch[50],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
      child: Center(
        child: SizedBox(
          width: constraints.maxWidth * 0.1,
          child: const Divider(
            color: Colors.black,
            thickness: 3,
            height: 20,
          ),
        ),
      ),
    );
  }

  Widget _buildPhoto(
    BoxConstraints constraints,
    PhotoEntity photo,
  ) =>
      Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              width: constraints.maxWidth * 0.34,
              color: Colors.black,
              child: Hero(
                tag: photo.url.getOrCrash(),
                child: CachedNetworkImage(
                    fit: BoxFit.fitWidth,
                    fadeInDuration: const Duration(milliseconds: 150),
                    placeholder: (context, url) =>
                        Image.memory(kTransparentImage),
                    imageUrl: photo.url.getOrCrash()),
              ),
            ),
          ),
          Positioned(
              bottom: 5,
              right: 5,
              child: Icon(
                photo.isFavourite ? Icons.favorite : Icons.favorite_border,
                color: Colors.red,
                size: 22,
              ))
        ],
      );

  Widget _buildPhotoDescription(BoxConstraints constraints, PhotoEntity photo,
          NumberFormat formatter) =>
      Expanded(
        child: Container(
          margin: const EdgeInsets.only(top: 4),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(photo.details.name.getOrCrash(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold,
                  )),
              const SizedBox(
                height: 5,
              ),
              Text(
                formatter.format(photo.details.price.getOrCrash()),
                style: TextStyle(
                    color: Colors.green.shade500,
                    fontSize: 16.0,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 30,
              ),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "COMMENTS",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12.0,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: 40,
                      child: Divider(
                          height: 10, thickness: 2, color: primaryColor),
                    ),
                    Text(
                      photo.details.comments.getOrCrash(),
                      style: const TextStyle(
                          color: Colors.black,
                          fontSize: 14.0,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
}
