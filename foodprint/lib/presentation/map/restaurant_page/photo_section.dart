import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/presentation/map/restaurant_page/photo_card.dart';

class PhotoSection extends StatelessWidget {
  final List<PhotoEntity> photos;
  const PhotoSection({Key key, @required this.photos}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10.0),
      color: Colors.white,
      height: 400,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12.0, 12.0, 12.0, 15.0),
            child: Row(
              children: const [
                Icon(
                  Icons.photo,
                ),
                SizedBox(
                  width: 5.0,
                ),
                Text(
                  "Your photos",
                  style: TextStyle(fontSize: 15.0),
                )
              ],
            ),
          ),
          displayPhotos(context),
        ],
      ),
    );
  }

  Widget displayPhotos(BuildContext context) {
       return Expanded(
        child: Padding(
      padding: const EdgeInsets.only(bottom: 12.0, left: 12.0),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: photos.length,
          itemBuilder: (BuildContext context, int index) {
            final PhotoEntity photo = photos[index];
            return PhotoCard(photo: photo);
          }),
    ));
  }
}