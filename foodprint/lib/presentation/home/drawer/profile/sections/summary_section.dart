import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/domain/core/value_transformers.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';

class SummarySection extends StatelessWidget {
  final FoodprintEntity foodprint;
  const SummarySection({Key key, @required this.foodprint}) : super(key: key);

  int get numLocations => foodprint.restaurantPhotos.keys.length;
  int get numFavourites => foodprint.restaurantPhotos.values.fold(
      0, (prev, photos) => prev + photos.where((p) => p.isFavourite).length);

  @override
  Widget build(BuildContext context) {
    final List<Tuple2<PhotoEntity, RestaurantEntity>> photos =
        getPhotosFromFoodprint(foodprint);

    return Row(
      children: [
        _buildStatCard(
            title: photos.length == 1 ? 'Photo' : 'Photos',
            count: photos.length.toString(),
            color: Colors.purple),
        _buildStatCard(
            title: numLocations == 1 ? 'Location' : 'Locations',
            count: numLocations.toString(),
            color: Colors.lightBlue),
        _buildStatCard(
            title: numFavourites == 1 ? 'Favourite' : 'Favourites',
            count: numFavourites.toString(),
            color: Colors.green),
      ],
    );
  }

  Expanded _buildStatCard({String count, String title, Color color}) {
    return Expanded(
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(20.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              count,
              style: const TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              title,
              style: TextStyle(
                color: Colors.orange.shade900,
                fontSize: 15.0,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
