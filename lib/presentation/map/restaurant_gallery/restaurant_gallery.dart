import 'package:cached_network_image/cached_network_image.dart';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/common/image_dimensions.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:intl/intl.dart';
import 'package:transparent_image/transparent_image.dart';
import 'package:provider/provider.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
  Widget build(BuildContext context) => GestureDetector(
        onVerticalDragEnd: (details) {
          final dy = details.velocity.pixelsPerSecond.dy;
          if (dy > 0) Navigator.pop(context);
        },
        child: Scaffold(
          backgroundColor: foodprintPrimaryColorSwatch[50],
          body: LayoutBuilder(builder: (context, constraints) {
            return Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Text(
                      restaurant.name.getOrCrash(),
                      textAlign: TextAlign.center,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 28,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: constraints.maxWidth * 0.3,
                    child: Divider(
                      color: Theme.of(context).primaryColor,
                      height: 20,
                      thickness: 2.0,
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.83,
                    child: PhotoCarousel(
                      restaurant: restaurant,
                      constraints: constraints,
                      photos: photos,
                    ),
                  )
                ],
              ),
            );
          }),
        ),
      );
}

class PhotoCarousel extends StatefulWidget {
  final RestaurantEntity restaurant;
  final List<PhotoEntity> photos;
  final BoxConstraints constraints;
  const PhotoCarousel({Key key, this.restaurant, this.photos, this.constraints})
      : super(key: key);

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

    return PortraitPhoto(
      photo: photo,
      topPadding: topPadding,
      constraints: widget.constraints,
      formatter: formatter,
      restaurant: widget.restaurant,
    );
  }
}
