
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:intl/intl.dart';

class RestaurantPage extends StatelessWidget {
  final RestaurantEntity restaurant;
  final List<PhotoEntity> photos;
  final Row ratings;
  const RestaurantPage({Key key, this.restaurant, this.photos, this.ratings}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString()
    );
    return Scaffold(
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(30.0),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0
                    )
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: const Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/images/stock_restaurant.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 40.0
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: const Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: const Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: const Icon(Icons.menu),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Positioned(
                left: 20.0,
                bottom: 20.0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      restaurant.restaurantName.getOrCrash(),
                      style: const TextStyle(
                        color: Colors.black,
                        fontFamily: "Gotham",
                        fontWeight: FontWeight.w600,
                        fontSize: 25,
                      ),
                    ),
                    ratings
                  ]
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.only(
                top: 10.0,
                bottom: 15.0
              ),
              itemCount: photos.length,
              itemBuilder: (context, index) {
                final PhotoEntity photo = photos[index];
                return Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  width: 120.0,
                                  child: Text(
                                    photo.photoDetail.name.getOrCrash(),
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  formatter.format(photo.photoDetail.price.getOrCrash()),
                                  style: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),
                            Text(
                              photo.photoDetail.comments.getOrCrash(),
                              style: const TextStyle(
                                color: Colors.grey
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(photo.timestamp.getOrCrash())
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 20.0,
                      top: 15.0,
                      bottom: 15.0,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20.0),
                        child: Image.memory(
                          photo.bytes,
                          width: 110.0,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}