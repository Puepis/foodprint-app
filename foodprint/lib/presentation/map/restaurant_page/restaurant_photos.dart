import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/map/restaurant_page/photo_section.dart';

class RestaurantPhotos extends StatelessWidget {
  final RestaurantEntity restaurant;
  final List<PhotoEntity> photos;
  final Row ratings;
  const RestaurantPhotos({Key key, this.restaurant, this.photos, this.ratings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(150.0),
        child: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Center(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(30, 40, 30, 20),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    restaurant.restaurantName.getOrCrash(),
                    style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                    overflow: TextOverflow.ellipsis,
                    maxLines: 1,
                  ),
                  const SizedBox(
                    height: 5.0,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star_border,
                        color: Colors.black,
                      ),
                      const SizedBox(
                        width: 3.0,
                      ),
                      Text(
                        restaurant.restaurantRating.getOrCrash().toString(),
                        style: const TextStyle(
                            fontSize: 25,
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        color: Colors.grey.shade200,
        child: ListView(
          children: [
            PhotoSection(
              photos: photos,
            )
          ],
        ),
      ),
    );
  }
}
