import 'package:flutter/material.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/photos/photo_detail_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:intl/intl.dart';
import 'package:foodprint/domain/core/value_transformers.dart';

/// Displays the [photo] in the form of a card under the
/// [PhotoSection] of the [RestaurantPhotos] page
class PhotoCard extends StatelessWidget {
  const PhotoCard({
    Key key,
    @required this.photo,
  }) : super(key: key);

  final PhotoEntity photo;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: Colors.transparent,
      margin: const EdgeInsets.only(right: 12.0),
      elevation: 0.0,
      clipBehavior: Clip.antiAlias,
      child: Container(
        width: MediaQuery.of(context).size.width * 0.75,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            DisplayImage(
              photoUrl: photo.url,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(10.0),
                    bottomRight: Radius.circular(10.0)),
                border: Border.all(width: 0.5, color: Colors.grey.shade400),
                color: Colors.white,
              ),
              height: 100,
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Expanded(
                    child: DisplayInfo(
                        isFavourite: photo.isFavourite,
                        photoDetail: photo.photoDetail,
                        timestamp: photo.timestamp),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

/// Displays the photo details
class DisplayInfo extends StatelessWidget {
  const DisplayInfo({
    Key key,
    @required this.isFavourite,
    @required this.photoDetail,
    @required this.timestamp,
  }) : super(key: key);

  final bool isFavourite;
  final PhotoDetailEntity photoDetail;
  final Timestamp timestamp;

  @override
  Widget build(BuildContext context) {
    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              photoDetail.name.getOrCrash(),
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.bold,
              ),
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            Icon(
              isFavourite ? Icons.favorite : Icons.favorite_border,
              color: Colors.red,
            ),
          ],
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          formatter.format(photoDetail.price.getOrCrash()),
          style: TextStyle(
              color: Colors.green.shade500,
              fontSize: 18.0,
              fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 5.0,
        ),
        Text(
          timestamp.toReadable(),
          style: const TextStyle(fontSize: 15.0),
        )
      ],
    );
  }
}

class DisplayImage extends StatelessWidget {
  const DisplayImage({
    Key key,
    @required this.photoUrl,
  }) : super(key: key);

  final URL photoUrl;

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10.0),
        child: Image(
          image: NetworkImage(photoUrl.getOrCrash()),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
