import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/gallery/image/photo_info_sheet.dart';

/// Displays the full image
class FullImagePage extends StatefulWidget {
  final PhotoEntity photo;
  final RestaurantEntity restaurant;
  const FullImagePage({Key key, this.photo, this.restaurant}) : super(key: key);

  @override
  _FullImagePageState createState() => _FullImagePageState();
}

class _FullImagePageState extends State<FullImagePage> {
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
                  child: FittedBox(
                      fit: BoxFit.fitWidth,
                      child: Image.network(widget.photo.url.getOrCrash())),
                ),
              ),
            ),
            PhotoInfoSheet(
              photo: widget.photo,
              restaurant: widget.restaurant,
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
