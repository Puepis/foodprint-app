import 'package:flutter/material.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:intl/intl.dart';

class FullImage extends StatelessWidget {
  final FoodprintPhoto image;
  FullImage({Key key, @required this.image}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString()
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: GestureDetector(
          onVerticalDragEnd: (details) {
            double dy = details.velocity.pixelsPerSecond.dy;
            if (dy > 0) { // swipe down
              Navigator.pop(context);
            }
            else if (dy < 0) { // swipe up
              // show photo details
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20.0),
                      topRight: Radius.circular(20.0),
                    ),
                    color: Colors.black87
                  ),
                  padding: EdgeInsets.all(20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        image.name,
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Gotham",
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                        ),
                      ),
                      Text(
                        formatter.format(image.price),
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Gotham",
                          fontWeight: FontWeight.bold,
                          fontSize: 19
                        ),
                      ),
                      Divider(
                        color: Colors.grey,
                        height: 30,
                        thickness: 1,
                      ),
                      Text(
                        image.timestamp,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Gotham",
                          fontSize: 16
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Text(
                        image.caption,
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Gotham",
                          fontSize: 16
                        ),
                      ),
                      SizedBox(height: 22.0),
                      Text(
                        "LOCATION",
                        style: TextStyle(
                          color: Colors.grey,
                          fontFamily: "Gotham",
                          fontSize: 10
                        ),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        image.restaurantName,
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Gotham",
                          fontSize: 19
                        ),
                      ),
                      SizedBox(height: 5.0,),
                      Text(
                        "Rating: ${image.restaurantRating}",
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: "Gotham",
                          fontSize: 13
                        ),
                      ),
                      SizedBox(height: 5.0),
                      Row(
                        children: getRatings(image.restaurantRating),
                      ),
                      SizedBox(height: 10.0),
                      Text(
                        "${image.latitude}, ${image.longitude}",
                        style: TextStyle(
                          fontFamily: "Gotham",
                          color: Colors.grey,
                          fontSize: 13
                        ),
                      )
                    ],
                  ),
                )
              );
            }
          },
         child: Center(
            child: Image.memory(image.imgBytes),
          ),
        ),
      )
    );
  }

  // TODO: Remove duplicate code
  List<Widget> getRatings(double rating) {
    List<Widget> ratings = [];
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
