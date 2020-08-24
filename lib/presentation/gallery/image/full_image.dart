import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:foodprint/presentation/data/gallery_photo.dart';
import 'package:foodprint/presentation/walkthrough/overlays/full_image_overlay.dart';
import 'package:foodprint/presentation/walkthrough/walkthrough_model.dart';
import 'package:provider/provider.dart';

import 'image.dart';

/// Displays the full image
class FullImage extends StatefulWidget {
  static const routeName = "full_image/";
  const FullImage({Key key}) : super(key: key);

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
    final walkthrough = context.watch<WalkthroughModel>();
    final galleryPhoto = context.watch<GalleryPhotoModel>();
    final photo = galleryPhoto.photo;

    if (_position != null) _handleScroll();

    return GestureDetector(
      onVerticalDragEnd: (details) {
        final dy = details.velocity.pixelsPerSecond.dy;
        if (dy > 0) Navigator.pop(context);
      },
      child: WillPopScope(
        onWillPop: () async {
          if (walkthrough.screen == 6) {
            walkthrough.next();
          }
          return true;
        },
        child: Scaffold(
          backgroundColor: Colors.black,
          body: CustomScrollView(controller: _scrollController, slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  height: MediaQuery.of(context).size.height,
                  color: Colors.black,
                  child: Stack(
                    children: [
                      Center(
                        child: Hero(
                          tag: photo.timestamp.getOrCrash(),
                          child: CachedNetworkImage(
                              fit: BoxFit.fitWidth,
                              fadeInDuration: const Duration(milliseconds: 150),
                              placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator(),
                                  ),
                              imageUrl: photo.url.getOrCrash()),
                        ),
                      ),
                      Align(
                        alignment: const Alignment(0, 0.95),
                        child: Icon(
                          _position == null ||
                                  _position.pixels == _position.minScrollExtent
                              ? Icons.keyboard_arrow_up
                              : Icons.keyboard_arrow_down,
                          color: Colors.white,
                          size: 34,
                        ),
                      ),
                      const FullImageOverlay()
                    ],
                  ),
                ),
                const PhotoInfoSheet()
              ]),
            )
          ]),
        ),
      ),
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
