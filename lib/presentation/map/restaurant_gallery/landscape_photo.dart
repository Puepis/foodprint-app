part of 'restaurant_gallery.dart';

/// The layout for displaying a photo in landscape mode
class LandscapePhoto extends StatelessWidget {
  const LandscapePhoto({
    Key key,
    @required this.photo,
    @required this.topPadding,
    @required this.constraints,
    @required this.formatter,
  }) : super(key: key);

  final PhotoEntity photo;
  final double topPadding;
  final BoxConstraints constraints;
  final NumberFormat formatter;

  @override
  Widget build(BuildContext context) => Container(
        margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
        padding: EdgeInsets.only(
          top: topPadding,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: constraints.maxHeight * 0.90,
              width: constraints.maxWidth * 0.6,
              color: Colors.black,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: FadeInImage.memoryNetwork(
                    fadeInDuration: const Duration(milliseconds: 200),
                    placeholder: kTransparentImage,
                    image: photo.url.getOrCrash()),
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(photo.details.name.getOrCrash(),
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold,
                        )),
                    Text(
                      formatter.format(photo.details.price.getOrCrash()),
                      style: TextStyle(
                          color: Colors.green.shade500,
                          fontSize: 20.0,
                          fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "COMMENTS",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 50,
                            child: Divider(
                                height: 10, thickness: 2, color: primaryColor),
                          ),
                          Text(
                            photo.details.comments.getOrCrash(),
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 14.0,
                                fontWeight: FontWeight.normal),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      photo.isFavourite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: Colors.red,
                      size: 30,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      );
}
