import 'dart:math';

import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

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
      backgroundColor: foodprintPrimaryColorSwatch[100],
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

    final photo = widget.photos[index];
    final scale = max(_viewportFraction,
        (1 - (_pageOffset - index).abs()) + _viewportFraction);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 20.0),
      padding: EdgeInsets.only(
        top: 46 - scale * 20,
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
