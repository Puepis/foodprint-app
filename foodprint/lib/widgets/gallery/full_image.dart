import 'package:flutter/material.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/styles/text_styles.dart';
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
                builder: (context) => _photoDetails(formatter)
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

  Widget _photoDetails(formatter) => Container(
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
          mainAxisAlignment: MainAxisAlignment.start,
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
            Divider(
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
              image.restaurant.name,
              style: subtitleTextStyle
            ),
            const SizedBox(height: 5.0,),
            Row(
              children: getRatings(image.restaurant.rating),
            ),
            const SizedBox(height: 10.0),
            Text(
              "${image.restaurant.latitude}, ${image.restaurant.longitude}",
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
    List<Widget> ratings = [
      Text(
        rating.toString(),
        style: const TextStyle(
            fontSize: 16,
            color: Colors.white
        ),
      ),
      SizedBox(width: 5.0,)
    ];
    for (int i = 0; i < 5; ++i) {
      if (rating - i >= 1) { // full star
        ratings.add(
          Icon(
            Icons.star,
            color: Colors.orange,
          )
        );
      } else if (rating - i < 1 && i < rating) { // half star
        ratings.add(
          Icon(
            Icons.star_half,
            color: Colors.orange
          )
        );
      } else { // no star
        ratings.add(
          Icon(
            Icons.star_border,
            color: Colors.orange,
          )
        );
      }
    }
    return ratings;
  }
}
