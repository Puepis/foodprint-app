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
  Widget build(BuildContext context) {
    /// Get image dimensions to determine background color
    final image = Image.network(photo.url.getOrCrash());
    final completer = Completer<ui.Image>();
    image.image.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((info, _) => completer.complete(info.image)));

    return FutureBuilder<ui.Image>(
        future: completer.future,
        builder: (context, snapshot) {
          Color bgColor = Colors.transparent;

          // Check if image is portrait or landscape
          if (snapshot.hasData) {
            bgColor = snapshot.data.width > snapshot.data.height
                ? Colors.black
                : Colors.transparent;
          }
          return Container(
            margin: const EdgeInsets.all(10),
            padding: EdgeInsets.only(
              top: topPadding,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Expanded(
                  child: Container(
                    height: constraints.maxHeight,
                    width: constraints.maxWidth,
                    color: bgColor,
                    child: CachedNetworkImage(
                        fit: BoxFit.scaleDown,
                        fadeInDuration: const Duration(milliseconds: 150),
                        placeholder: (context, url) =>
                            Image.memory(kTransparentImage),
                        imageUrl: photo.url.getOrCrash()),
                  ),
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
          );
        });
  }
}
