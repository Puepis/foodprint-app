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
    /// Get image dimensions to determine background color
    final image = Image.network(widget.photo.url.getOrCrash());
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
                context.read<UserData>().updatePhoto(widget.restaurant,
                    widget.photo.copyWith(isFavourite: state.isFavourite));
              }
            },
            child: Container(
              margin: const EdgeInsets.all(10),
              padding: EdgeInsets.only(
                top: widget.topPadding,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                    child: Container(
                      height: widget.constraints.maxHeight,
                      width: widget.constraints.maxWidth,
                      color: bgColor,
                      child: CachedNetworkImage(
                          fit: BoxFit.scaleDown,
                          fadeInDuration: const Duration(milliseconds: 150),
                          placeholder: (context, url) =>
                              Image.memory(kTransparentImage),
                          imageUrl: widget.photo.url.getOrCrash()),
                    ),
                  ),
                  Container(
                    width: widget.constraints.maxWidth,
                    padding: const EdgeInsets.only(top: 10),
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
                                widget.formatter.format(
                                    widget.photo.details.price.getOrCrash()),
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
                        IconButton(
                            icon: Icon(
                              _isFavourite
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                              size: 26,
                            ),
                            onPressed: () {
                              setState(() => _isFavourite = !_isFavourite);
                              context.bloc<PhotoActionsBloc>().add(
                                  FavouriteChanged(
                                      photo: widget.photo,
                                      newFavourite: _isFavourite));
                            })
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
        });
  }
}
