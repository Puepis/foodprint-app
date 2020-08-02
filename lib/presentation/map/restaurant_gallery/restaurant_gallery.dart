import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';

part 'landscape_photo.dart';
part 'portrait_photo.dart';

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
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(20, 50, 20, 5),
            child: Text(
              restaurant.restaurantName.getOrCrash(),
              textAlign: TextAlign.center,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 30,
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

    return LayoutBuilder(
      builder: (context, constraints) => constraints.maxWidth < 600
          ? PortraitPhoto(
              photo: photo,
              topPadding: topPadding,
              constraints: constraints,
              formatter: formatter)
          : LandscapePhoto(
              photo: photo,
              topPadding: topPadding,
              constraints: constraints,
              formatter: formatter),
    );
  }
}
