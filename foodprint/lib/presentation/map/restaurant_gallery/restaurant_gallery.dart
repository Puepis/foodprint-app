import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

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
      appBar: AppBar(title: Text(restaurant.restaurantName.getOrCrash())),
      body: Container(),
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

  @override
  void initState() {
    super.initState();
    _pageController =
        PageController(initialPage: 1, viewportFraction: _viewportFraction);
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
    final photo = widget.photos[index];
    return AnimatedBuilder(
      animation: _pageController,
      builder: (context, child) {
        double value = 1;
        if (_pageController.position.haveDimensions) {
          value = _pageController.page - index;
          value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0) as double;
        }
        return Center(
          child: SizedBox(
            height: Curves.easeInOut.transform(value) * 270.0,
            width: Curves.easeInOut.transform(value) * 400.0,
            child: widget,
          ),
        );
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          boxShadow: [
            const BoxShadow(
              color: Colors.black54,
              offset: Offset(0.0, 4.0),
              blurRadius: 10.0,
            ),
          ],
        ),
        child: Center(
          child: Hero(
            tag: photo.url.getOrCrash(),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image(
                image: NetworkImage(photo.url.getOrCrash()),
                height: 220.0,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
