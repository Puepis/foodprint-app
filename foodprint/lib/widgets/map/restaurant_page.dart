import 'package:flutter/material.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:intl/intl.dart';
import 'package:foodprint/service/ratings.dart';

class RestaurantCard extends StatelessWidget {
  final Restaurant restaurant;
  final List<FoodprintPhoto> photos;
  const RestaurantCard({Key key, this.restaurant, this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ratingsWidget = restaurant.rating.ratingsWidget;
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
        child: Hero(
          tag: 'title',
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(
                  restaurant.name,
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
      ),
    );
  }

  Widget getPhotos() {
    return Expanded(
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: photos.length,
        itemBuilder: (BuildContext context, int index) {
          final FoodprintPhoto photo = photos[index];
          return Container(
            width: 100,
            margin: const EdgeInsets.fromLTRB(0.0, 0.0, 10.0, 5.0),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: MemoryImage(photo.imgBytes),
                    fit: BoxFit.cover
                )
            ),
          );
        },
      ),
    );
  }
}

class RestaurantPage extends StatelessWidget {
  final Restaurant restaurant;
  final List<FoodprintPhoto> photos;
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
                child: Hero(
                  tag: 'title',
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        restaurant.name,
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
                final FoodprintPhoto photo = photos[index];
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
                                    photo.name,
                                    style: const TextStyle(
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                    maxLines: 2,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ),
                                Text(
                                  formatter.format(photo.price),
                                  style: const TextStyle(
                                    fontSize: 22.0,
                                    fontWeight: FontWeight.bold
                                  ),
                                )
                              ],
                            ),
                            Text(
                              photo.caption,
                              style: const TextStyle(
                                color: Colors.grey
                              ),
                            ),
                            const SizedBox(height: 10.0),
                            Text(photo.timestamp)
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
                          photo.imgBytes,
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
