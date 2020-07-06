import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:intl/intl.dart';
import 'package:foodprint/domain/core/value_transformers.dart';

class RestaurantPage extends StatelessWidget {
  final RestaurantEntity restaurant;
  final List<PhotoEntity> photos;
  final Row ratings;
  const RestaurantPage({Key key, this.restaurant, this.photos, this.ratings})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100.0),
        child: AppBar(
          centerTitle: true,
          automaticallyImplyLeading: false,
          flexibleSpace: Center(
            child: Column(
              children: [
                Text(
                  restaurant.restaurantName.getOrCrash(),
                  style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontSize: 30,
                  ),
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
                      restaurant.restaurantRating.getOrCrash().toString(),
                      style: const TextStyle(fontSize: 30, color: Colors.black),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      body: Container(
        margin: const EdgeInsets.only(top: 10.0),
        child: ListView(
          children: [
            Container(
              color: Colors.white,
              padding: const EdgeInsets.all(5.0),
              height: 400,
              child: Column(
                children: [
                  Row(
                    children: const [
                      Icon(
                        Icons.photo,
                      ),
                      Text(
                        "Your photos",
                        style: TextStyle(fontSize: 15.0),
                      )
                    ],
                  ),
                  displayPhotos(context),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget displayPhotos(BuildContext context) {
    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return Expanded(
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: photos.length,
            itemBuilder: (BuildContext context, int index) {
              final PhotoEntity photo = photos[index];
              return Container(
                width: 500,
                margin: const EdgeInsets.only(right: 10.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                child: Column(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: Image(
                          image: MemoryImage(photo.bytes),
                          fit: BoxFit.fitWidth,
                        )),
                    Container(
                      color: Colors.white,
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  photo.photoDetail.name.getOrCrash(),
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                Text(
                                  formatter.format(
                                      photo.photoDetail.price.getOrCrash()),
                                  style: const TextStyle(
                                      fontSize: 22.0,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  photo.photoDetail.comments.getOrCrash(),
                                  style: const TextStyle(color: Colors.black),
                                ),
                                Text(photo.timestamp.toReadable())
                              ],
                            ),
                          ),
                          Center(
                            child: Column(
                              children: const [
                                Icon(
                                  Icons.favorite_border,
                                  color: Colors.red,
                                ),
                                Text(
                                  "Favourite",
                                  style: TextStyle(fontSize: 15.0),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              );
            }));
  }
}
