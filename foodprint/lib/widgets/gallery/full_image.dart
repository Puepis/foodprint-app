import 'package:flutter/material.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:foodprint/styles/text_styles.dart';
import 'package:intl/intl.dart';

class FullImage extends StatelessWidget {
  final Restaurant restaurant;
  final FoodprintPhoto image;
  const FullImage({Key key, @required this.restaurant, @required this.image}) : super(key: key);

  
  @override
  Widget build(BuildContext context) {

    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString()
    );

    return Scaffold(
      backgroundColor: Colors.black,
      body: GestureDetector(
        onVerticalDragEnd: (details) {
          final double dy = details.velocity.pixelsPerSecond.dy;
          if (dy > 0) { // swipe down
            Navigator.pop(context);
          }
          else if (dy < 0) { // swipe up
            // show photo details
            showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (context) => _photoDetails(formatter)
            );
          }
        },
       child: Center(
          child: Image.memory(image.imgBytes),
        ),
      )
    );
  }

  Widget _photoDetails(NumberFormat formatter) => Container(
    decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0),
          topRight: Radius.circular(20.0),
        ),
        color: Colors.black87
    ),
    padding: const EdgeInsets.all(20),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              image.name,
              style: itemNameTextStyle
            ),
            Text(
              formatter.format(image.price),
              style: subtitleTextStyle
            ),
            const Divider(
              color: Colors.grey,
              height: 30,
              thickness: 1,
            ),
            const Text(
              "TIMESTAMP",
              style: labelTextStyle,
            ),
            const SizedBox(height: 5.0),
            Text(
              image.timestamp,
              style: largeTextStyle
            ),
            const SizedBox(height: 20),
            const Text(
              "COMMENTS",
              style: labelTextStyle,
            ),
            const SizedBox(height: 5.0,),
            Text(
              image.caption,
              style: largeTextStyle
            ),
            const SizedBox(height: 20.0),
            const Text(
              "LOCATION",
              style: labelTextStyle
            ),
            const SizedBox(height: 5.0),
            Text(
              restaurant.name,
              style: subtitleTextStyle
            ),
            const SizedBox(height: 5.0,),
            Row(
              children: getRatings(restaurant.rating),
            ),
            const SizedBox(height: 10.0),
            Text(
              "${restaurant.latitude}, ${restaurant.longitude}",
              style: coordsTextStyle
            )
          ],
        ),
        Positioned(
          top: 5.0,
          right: 5.0,
          child: IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.blue,
            onPressed: () {},
          ),
        )
      ],
    ),
  );

  List<Widget> getRatings(double rating) {
    final List<Widget> ratings = [
      Text(
        rating.toString(),
        style: const TextStyle(
            fontSize: 16,
            color: Colors.white
        ),
      ),
      const SizedBox(width: 5.0,)
    ];
    for (int i = 0; i < 5; ++i) {
      if (rating - i >= 1) { // full star
        ratings.add(
          const Icon(
            Icons.star,
            color: Colors.orange,
          )
        );
      } else if (rating > i) { // half star
        ratings.add(
          const Icon(
            Icons.star_half,
            color: Colors.orange
          )
        );
      } else { // no star
        ratings.add(
          const Icon(
            Icons.star_border,
            color: Colors.orange,
          )
        );
      }
    }
    return ratings;
  }
}
