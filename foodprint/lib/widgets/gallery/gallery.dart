
import 'package:flutter/material.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/widgets/gallery/full_image.dart';
import 'package:provider/provider.dart';

class Gallery extends StatelessWidget {

  List<Widget> _buildPhotos(BuildContext context) {
    var user = Provider.of<UserModel>(context); // grab notifier
    List<FoodprintPhoto> photos = user.photos;

    // No photos yet
    if (photos == null || photos.isEmpty){
      return const <Card>[];
    }

    // Sort directories from newest to oldest
    //photos.sort((a, b) => getTimeTaken(b).compareTo(getTimeTaken(a)));

    // Render photos
    return photos.map((photo) {
      return GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) => FullImage(image: photo)
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
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // columns
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(10.0),
      children: _buildPhotos(context),
    );
  }
}
