import 'package:flutter/material.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/styles/text_styles.dart';
import 'package:foodprint/widgets/gallery/edit_image.dart';
import 'package:intl/intl.dart';
import 'package:foodprint/service/ratings.dart';

class FullImage extends StatelessWidget {
  final UserModel user;
  final Restaurant restaurant;
  final FoodprintPhoto image;
  const FullImage({Key key, @required this.user, @required this.restaurant, @required this.image}) : super(key: key);

  
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
              builder: (cxt) => _photoDetails(cxt, formatter)
            );
          }
        },
       child: Center(
          child: Image.memory(image.imgBytes),
        ),
      )
    );
  }

  Widget _photoDetails(BuildContext context, NumberFormat formatter) => Container(
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
            restaurant.rating.ratingsWidget,
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
            onPressed: () async {
              Navigator.push(context, MaterialPageRoute(
                builder: (_) => EditImageScreen(
                  user: user,
                  photo: image,
                )
              ));
            },
          ),
        )
      ],
    ),
  );
}
