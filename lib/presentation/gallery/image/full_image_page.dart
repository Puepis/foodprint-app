import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/gallery/image/photo_info_sheet.dart';

class FullImagePage extends StatelessWidget {
  final PhotoEntity photo;
  final RestaurantEntity restaurant;
  const FullImagePage({Key key, this.photo, this.restaurant}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // A nested navigator representing the "edit image" journey.
    return Navigator(
      initialRoute: FullImage.routeName,
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case FullImage.routeName:
            builder = (_) => FullImage(
                  restaurant: restaurant,
                  photo: photo,
                  onEdit: () => Navigator.pop(
                      context), // if the image is edited, pop the entire route
                );
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

/// Displays the full image
class FullImage extends StatefulWidget {
  static const routeName = "full_image/";
  final PhotoEntity photo;
  final RestaurantEntity restaurant;
  final VoidCallback onEdit;
  const FullImage({Key key, this.photo, this.restaurant, this.onEdit})
      : super(key: key);

  @override
  _FullImageState createState() => _FullImageState();
}

class _FullImageState extends State<FullImage> {
  ScrollController _scrollController;
  ScrollPosition _position;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(
          () => setState(() => _position = _scrollController.position));
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (_position != null) _handleScroll();

    return Scaffold(
      backgroundColor: Colors.black,
      body: CustomScrollView(controller: _scrollController, slivers: [
        SliverList(
          delegate: SliverChildListDelegate([
            Container(
              height: MediaQuery.of(context).size.height,
              color: Colors.black,
              child: Center(
                child: Hero(
                  tag: widget.photo.timestamp.getOrCrash(),
                  child: CachedNetworkImage(
                      fit: BoxFit.fitWidth,
                      fadeInDuration: const Duration(milliseconds: 150),
                      placeholder: (context, url) => const Center(
                            child: CircularProgressIndicator(),
                          ),
                      imageUrl: widget.photo.url.getOrCrash()),
                ),
              ),
            ),
            PhotoInfoSheet(
              photo: widget.photo,
              restaurant: widget.restaurant,
              onEdit: widget.onEdit,
            )
          ]),
        )
      ]),
    );
  }

  /// Snaps to the vertical edges of the screen depending on the user's scroll direction
  void _handleScroll() {
    // Move to the bottom
    if (_position.userScrollDirection == ScrollDirection.reverse) {
      _scrollController.animateTo(_position.maxScrollExtent,
          curve: Curves.easeOut, duration: const Duration(milliseconds: 50));
    }
    if (_position.userScrollDirection == ScrollDirection.forward) {
      _scrollController.animateTo(_position.minScrollExtent,
          curve: Curves.easeOut, duration: const Duration(milliseconds: 50));
    }
  }
}
