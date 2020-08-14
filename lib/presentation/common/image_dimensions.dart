import 'dart:async';
import 'dart:ui' as ui;

import 'package:flutter/material.dart';

typedef DimensionsBuilder = Widget Function(
    BuildContext, AsyncSnapshot<ui.Image>);

class NetworkImageDimensionsBuilder extends StatelessWidget {
  final String imageUrl;
  final DimensionsBuilder builder;
  const NetworkImageDimensionsBuilder(
      {Key key, @required this.builder, @required this.imageUrl})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    /// Get image dimensions to determine background color
    final networkImage = Image.network(imageUrl);
    final completer = Completer<ui.Image>();
    networkImage.image.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((info, _) => completer.complete(info.image)));
    return FutureBuilder<ui.Image>(
      future: completer.future,
      builder: builder,
    );
  }
}
