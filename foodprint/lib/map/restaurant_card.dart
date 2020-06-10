import 'dart:io';

import 'package:flutter/material.dart';
import 'package:foodprint/models/photo_detail.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:intl/intl.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final List<List<Object>> photos;
  const RestaurantCard({Key key, this.restaurant, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) => RestaurantPage(
            restaurant: restaurant,
            photos: photos,
            ratings: getRatings(restaurant.rating)
          )
      )),
      child: Container(
        height: 250,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.0),
                topRight: Radius.circular(10.0)
            ),
            color: Colors.white
        ),
        padding: EdgeInsets.all(20),
        child: Hero(
          tag: 'title',
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  restaurant.name,
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Gotham",
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                  ),
                ),
                Row(
                    children: getRatings(restaurant.rating)
                ),
                SizedBox(height: 20.0),
                Text(
                  "YOUR PHOTOS",
                  style: TextStyle(
                      color: Colors.grey,
                      fontFamily: "Gotham",
                      fontSize: 10
                  ),
                ),
                SizedBox(height: 5.0),
                getPhotos(),
              ]
          ),
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
          File imgFile = photos[index][0];
          return Container(
            width: 100,
            margin: EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 5.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: FileImage(imgFile),
                    fit: BoxFit.cover
                )
            ),
          );
        },
      ),
    );
  }

  List<Widget> getRatings(rating) {
    List<Widget> ratings = [
      Text(
        rating.toString(),
        style: TextStyle(
            color: Colors.grey,
            fontFamily: "Gotham",
            fontWeight: FontWeight.bold,
            fontSize: 14
        ),
      ),
    ];

    for (int i = 0; i < 5; ++i) {
      if (rating - i >= 1) { // full star
        ratings.add(
            Icon(
              Icons.star,
              color: Colors.yellow,
            )
        );
      } else if (rating - i < 1 && i < rating) { // half star
        ratings.add(
            Icon(
                Icons.star_half,
                color: Colors.yellow
            )
        );
      } else { // no star
        ratings.add(
            Icon(
              Icons.star_border,
              color: Colors.black,
            )
        );
      }
    }
    return ratings;
  }
}

class RestaurantPage extends StatelessWidget {
  final Restaurant restaurant;
  final List<List<Object>> photos;
  final List<Widget> ratings;
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
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black26,
                      offset: Offset(0.0, 2.0),
                      blurRadius: 6.0
                    )
                  ]
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(30.0),
                  child: Image(
                    fit: BoxFit.cover,
                    image: AssetImage('assets/stock_restaurant.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 40.0
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.arrow_back),
                      iconSize: 30.0,
                      color: Colors.black,
                      onPressed: () => Navigator.pop(context),
                    ),
                    Row(
                      children: [
                        IconButton(
                          icon: Icon(Icons.search),
                          iconSize: 30.0,
                          color: Colors.black,
                          onPressed: () => Navigator.pop(context),
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
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
                child: Hero(
                  tag: 'title',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
                        style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Gotham",
                          fontWeight: FontWeight.w600,
                          fontSize: 25,
                        ),
                      ),
                      Row(
                          children: ratings
                      ),
                    ]
                  ),
                ),
              )
            ],
          ),
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.only(
                top: 10.0,
                bottom: 15.0
              ),
              itemCount: photos.length,
              itemBuilder: (context, index) {
                File imgFile = photos[index][0];
                PhotoDetail contents = photos[index][1];
                return Stack(
                  children: [
                    Container(
                      margin: EdgeInsets.fromLTRB(40.0, 5.0, 20.0, 5.0),
                      height: 170.0,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0)
                      ),
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(100.0, 20.0, 20.0, 20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 120.0,
                                  child: Text(
                                    contents.name,
                                    style: TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  formatter.format(contents.price),
                                  style: TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                            ),
                            Text(
                              contents.caption,
                              style: TextStyle(
                                color: Colors.grey
                              ),
                            ),
                            SizedBox(height: 10.0),
                            Text(contents.datetime)
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
                        child: Image.file(
                          imgFile,
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
