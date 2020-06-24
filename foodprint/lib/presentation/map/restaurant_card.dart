import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/common/ratings.dart';
import 'package:foodprint/presentation/map/restaurant_page.dart';

class RestaurantCard extends StatelessWidget {
  final RestaurantEntity restaurant;
  final List<PhotoEntity> photos;
  const RestaurantCard({Key key, this.restaurant, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ratingsWidget = restaurant.restaurantRating.getOrCrash().ratingsWidget;
    return GestureDetector(
      onDoubleTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) => RestaurantPage(
            restaurant: restaurant,
            photos: photos,
            ratings: ratingsWidget
          )
      )),
      child: Container( // TODO: display restaurant address
        height: 250,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)
            ),
            color: Colors.white
        ),
        padding: const EdgeInsets.all(20),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                restaurant.restaurantName.getOrCrash(),
                style: const TextStyle(
                    color: Colors.black,
                    fontFamily: "Gotham",
                    fontWeight: FontWeight.bold,
                    fontSize: 24
                ),
              ),
              ratingsWidget,
              const SizedBox(height: 20.0),
              const Text(
                "YOUR PHOTOS",
                style: TextStyle(
                    color: Colors.grey,
                    fontFamily: "Gotham",
                    fontSize: 10
                ),
              ),
              const SizedBox(height: 5.0),
              getPhotos(),
            ]
        ),
      ),
    );
  }

  Widget getPhotos() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: photos.length,
        itemBuilder: (BuildContext context, int index) {
          final PhotoEntity photo = photos[index];
          final Uint8List bytes = Uint8List.fromList(photo.imageData.getOrCrash());
          return Container(
            width: 100,
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 5.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: MemoryImage(bytes),
                    fit: BoxFit.cover
                )
            ),
          );
        },
      ),
    );
  }
}

