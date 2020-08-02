import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

/// Displays all the photos taken at a particular restaurant in a carousel
class RestaurantGallery extends StatelessWidget {
  static const routeName = "/restaurant_gallery";
  final RestaurantEntity restaurant;
  final List<PhotoEntity> photos;
  const RestaurantGallery(
      {Key key, @required this.restaurant, @required this.photos})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: foodprintPrimaryColorSwatch[50],
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              top: kToolbarHeight,
            ),
            child: Text(
              restaurant.restaurantName.getOrCrash(),
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 34,
              ),
            ),
          ),
          SizedBox(
            width: 100,
            child: Divider(
              color: Theme.of(context).primaryColor,
              height: 20,
              thickness: 2.0,
            ),
          ),
          Expanded(
            child: PhotoCarousel(
              photos: photos,
            ),
          )
        ],
      ),
    );
  }
}

class PhotoCarousel extends StatefulWidget {
  final List<PhotoEntity> photos;
  const PhotoCarousel({Key key, this.photos}) : super(key: key);

  @override
  _PhotoCarouselState createState() => _PhotoCarouselState();
}

class _PhotoCarouselState extends State<PhotoCarousel> {
  PageController _pageController;
  final double _viewportFraction = 0.8;
  double _pageOffset = 0;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: _viewportFraction)
      ..addListener(() {
        setState(() {
          _pageOffset = _pageController.page;
        });
      });
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageView.builder(
        controller: _pageController,
        itemCount: widget.photos.length,
        itemBuilder: (context, index) => _buildPhoto(index));
  }

  Widget _buildPhoto(int index) {
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    // Calculate padding
    double value = _pageOffset - index;
    value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0) as double;
    final topPadding = Curves.easeInOut.transform(1 - value) * 150;

    final photo = widget.photos[index];

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 14),
      padding: EdgeInsets.only(
        top: topPadding,
      ),
      child: Column(
        children: [
          FittedBox(
            fit: BoxFit.cover,
            child: FadeInImage.memoryNetwork(
                fadeInDuration: const Duration(milliseconds: 200),
                placeholder: kTransparentImage,
                image: photo.url.getOrCrash()),
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                RichText(
                  text: TextSpan(
                      text: '${photo.photoDetail.name.getOrCrash()}\n',
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                      ),
                      children: [
                        TextSpan(
                          text: formatter
                              .format(photo.photoDetail.price.getOrCrash()),
                          style: TextStyle(
                              height: 1.3,
                              color: Colors.green.shade500,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        )
                      ]),
                ),
                Icon(
                  photo.isFavourite ? Icons.favorite : Icons.favorite_border,
                  color: Colors.red,
                  size: 26,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
