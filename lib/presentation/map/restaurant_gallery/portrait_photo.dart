part of 'restaurant_gallery.dart';

/// The layout for displaying a photo in portrait mode
class PortraitPhoto extends StatefulWidget {
  const PortraitPhoto({
    Key key,
    @required this.photo,
    @required this.topPadding,
    @required this.constraints,
    @required this.formatter,
    @required this.restaurant,
  }) : super(key: key);

  final PhotoEntity photo;
  final RestaurantEntity restaurant;
  final double topPadding;
  final BoxConstraints constraints;
  final NumberFormat formatter;

  @override
  _PortraitPhotoState createState() => _PortraitPhotoState();
}

class _PortraitPhotoState extends State<PortraitPhoto> {
  bool _isFavourite;

  @override
  void initState() {
    super.initState();
    _isFavourite = widget.photo.isFavourite;
  }

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserData>();

    return NetworkImageDimensionsBuilder(
        imageUrl: widget.photo.url.getOrCrash(),
        builder: (context, image) {
          // Check if image is portrait or landscape
          if (image.hasData) {
            // Get image dimensions
            final width = image.data.width;
            final height = image.data.height;
            final imgHeight = width > height
                ? widget.constraints.maxHeight * 0.71
                : height.toDouble();

            final img = CachedNetworkImage(
                fit: BoxFit.scaleDown,
                fadeInDuration: const Duration(milliseconds: 150),
                placeholder: (context, url) => Image.memory(kTransparentImage),
                imageUrl: widget.photo.url.getOrCrash());

            return BlocListener<PhotoActionsBloc, PhotoActionsState>(
              listener: (_, state) {
                if (state is ChangeFavouriteFailure) {
                  FlushbarHelper.createError(
                      message: state.failure.maybeMap(
                          noInternet: (_) => 'No internet connection',
                          orElse: () => 'Server error')).show(context);
                }

                if (state is ChangeFavouriteSuccess) {
                  // Update foodprint
                  userData.updatePhoto(widget.restaurant,
                      widget.photo.copyWith(isFavourite: state.isFavourite));
                }
              },
              child: Container(
                margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                padding: EdgeInsets.only(
                  top: widget.topPadding,
                ),
                child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      if (width > height)
                        Container(
                          color: Colors.black,
                          height: imgHeight,
                          width: width.toDouble(),
                          child: img,
                        )
                      else
                        AspectRatio(
                          aspectRatio: width / height,
                          child: img,
                        ),
                      Container(
                        width: widget.constraints.maxWidth,
                        padding: const EdgeInsets.fromLTRB(6, 10, 6, 0),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.photo.details.name.getOrCrash(),
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Text(
                                    widget.formatter.format(widget
                                        .photo.details.price
                                        .getOrCrash()),
                                    style: TextStyle(
                                        height: 1.3,
                                        color: Colors.green.shade500,
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ),
                            SizedBox(width: widget.constraints.maxWidth * 0.05),
                            Align(
                              alignment: Alignment.topLeft,
                              child: InkWell(
                                onTap: () {
                                  setState(() => _isFavourite = !_isFavourite);
                                  context.bloc<PhotoActionsBloc>().add(
                                      FavouriteChanged(
                                          photo: widget.photo,
                                          newFavourite: _isFavourite,
                                          accessToken: userData.token));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Icon(
                                    _isFavourite
                                        ? Icons.favorite
                                        : Icons.favorite_border,
                                    color: Colors.red,
                                    size: 26,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }
          return Container();
        });
  }
}
