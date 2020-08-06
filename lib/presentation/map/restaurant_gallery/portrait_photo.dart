part of 'restaurant_gallery.dart';

/// The layout for displaying a photo in portrait mode
class PortraitPhoto extends StatelessWidget {
  const PortraitPhoto({
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
  Widget build(BuildContext context) => Column(
        children: [
          Container(
            margin: const EdgeInsets.all(10),
            padding: EdgeInsets.only(
              top: topPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: constraints.maxWidth,
                  color: Colors.black,
                  child: CachedNetworkImage(
                      fit: BoxFit.fitWidth,
                      fadeInDuration: const Duration(milliseconds: 150),
                      placeholder: (context, url) =>
                          Image.memory(kTransparentImage),
                      imageUrl: photo.url.getOrCrash()),
                ),
                Container(
                  width: constraints.maxWidth,
                  padding: const EdgeInsets.only(top: 10),
                  child: Row(
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              photo.details.name.getOrCrash(),
                              overflow: TextOverflow.ellipsis,
                              maxLines: 1,
                              style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Text(
                              formatter
                                  .format(photo.details.price.getOrCrash()),
                              style: TextStyle(
                                  height: 1.3,
                                  color: Colors.green.shade500,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      SizedBox(width: constraints.maxWidth * 0.05),
                      Icon(
                        photo.isFavourite
                            ? Icons.favorite
                            : Icons.favorite_border,
                        color: Colors.red,
                        size: 26,
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ],
      );
}
