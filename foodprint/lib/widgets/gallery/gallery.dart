
import 'package:flutter/material.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/widgets/gallery/full_image.dart';
import 'package:provider/provider.dart';

class Gallery extends StatelessWidget {

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
      return Container(
        child: Stack(
          children: [
            GestureDetector(
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
          ),
          Positioned(
            top: 2.5,
            right: 2.5,
            child: IconButton(
              icon: Icon(Icons.delete),
              iconSize: 25.0,
              color: Colors.white,
              onPressed: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(5.0),
                      topLeft: Radius.circular(5.0)
                    )
                  ),
                  backgroundColor: Colors.black87,
                  context: context,
                  builder: (context) => Container(
                    padding: EdgeInsets.only(bottom: 5.0),
                    child: Wrap(
                      children: [
                        Container(
                          child: Text(
                            "Are you sure you want to delete this photo?",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                            fontSize: 14.0,
                            color: Colors.white70
                            ),
                          ),
                          padding: EdgeInsets.fromLTRB(20.0, 20.0, 0.0, 5.0),
                        ),
                        ListTile(
                          leading: Icon(Icons.delete_outline, color: Colors.white70,),
                          title: Text(
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
                  )
                );
              },
            ),
          ),
        ]
        ),
      );
    }).toList();
  }


}
