

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/presentation/common/image_dimensions.dart';
import 'package:transparent_image/transparent_image.dart';

class PreviewPhoto extends StatelessWidget {
  const PreviewPhoto({
    Key key,
    @required this.constraints,
    @required this.photo,
  }) : super(key: key);

  final BoxConstraints constraints;
  final PhotoEntity photo;

  @override
  Widget build(BuildContext context) {
    return NetworkImageDimensionsBuilder(
        imageUrl: photo.url.getOrCrash(),
        builder: (context, image) {
          Color bgColor = Colors.transparent;
          // Check if image is portrait or landscape
          if (image.hasData) {
            bgColor = image.data.width > image.data.height
                ? Colors.black
                : Colors.transparent;
          }
          return ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Container(
              height: constraints.maxHeight,
              width: constraints.maxWidth * 0.4,
              color: bgColor,
              child: Hero(
                tag: photo.url.getOrCrash(),
                child: CachedNetworkImage(
                    fit: BoxFit.fitWidth,
                    fadeInDuration: const Duration(milliseconds: 150),
                    placeholder: (context, url) =>
                        Image.memory(kTransparentImage),
                    imageUrl: photo.url.getOrCrash()),
              ),
            ),
          );
        });
  }
}