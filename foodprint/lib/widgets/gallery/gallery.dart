
import 'package:flutter/material.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/widgets/gallery/full_image.dart';
import 'package:provider/provider.dart';
import 'package:foodprint/service/foodprint_extension.dart';

class Gallery extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // columns
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: const EdgeInsets.all(10.0),
      children: _buildPhotos(context),
    );
  }

  List<Widget> _buildPhotos(BuildContext context) {
    final user = context.watch<UserModel>();
    final List<FoodprintPhoto> photos = user.foodprint.photos;

    // No photos yet
    if (photos == null || photos.isEmpty){
      return const <Card>[];
    }

    // TODO: Sort photos by timestamp
    //photos.sort((a, b) => getTimeTaken(b).compareTo(getTimeTaken(a)));

    // Render photos
    return photos.map((photo) {
      final Restaurant restaurant = user.foodprint.getVisitedRestaurantFromId(photo.restaurantId);
      return Stack(
          children: [
            GestureDetector(
              onTap: () => Navigator.push(context, MaterialPageRoute(
                  builder: (context) => FullImage(image: photo, restaurant: restaurant,)
              )),
              child: Card(
                elevation: 0.0,
                clipBehavior: Clip.antiAlias,
                child: Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: MemoryImage(photo.imgBytes),
                          fit: BoxFit.cover
                      )
                  ),
                ),
              ),
            ),
            Positioned(
              top: 2.5,
              right: 2.5,
              child: IconButton(
                icon: const Icon(Icons.delete),
                iconSize: 25.0,
                color: Colors.white,
                onPressed: () {
                  showModalBottomSheet(
                      shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(5.0),
                              topLeft: Radius.circular(5.0)
                          )
                      ),
                      backgroundColor: Colors.black87,
                      context: context,
                      builder: (context) => _confirmationDialog(context, user, photo)
                  );
                },
              ),
            ),
          ]
      );
    }).toList();
  }

  Widget _confirmationDialog(BuildContext context, UserModel user, FoodprintPhoto photo) => Container(
    padding: const EdgeInsets.only(bottom: 5.0),
    child: Wrap(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 5.0),
          child: const Text(
            "Are you sure you want to delete this photo?",
            textAlign: TextAlign.left,
            style: TextStyle(
                fontSize: 14.0,
                color: Colors.white70
            ),
          ),
        ),
        ListTile(
          leading: const Icon(Icons.delete_outline, color: Colors.white70,),
          title: const Text(
            "Delete photo",
            style: TextStyle(
                color: Colors.white
            ),
          ),
          onTap: () async {
            await user.deletePhoto(photo);
            Navigator.pop(context);
          },
        )
      ],
    ),
  );
}
