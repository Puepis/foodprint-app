
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';


class Gallery extends StatelessWidget {

  List<Card> _buildPhotos(BuildContext context) {

    // Grab state from model
    var gallery = Provider.of<GalleryModel>(context);
    List<FileSystemEntity> photoFiles = gallery.photos;

    // No photos yet
    if (photoFiles == null || photoFiles.isEmpty){
      return const <Card>[];
    }

    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString()
    );

    // Render photos
    return photoFiles.map((file) {
      return Card(
        elevation: 0.0,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.file(file),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      file == null ? '' : "Photo",
                      softWrap: false,
                      maxLines: 1,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      file == null ? '' : formatter.format(15),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      );
    }).toList();
  }


  @override
  Widget build(BuildContext context) {
    return GridView.count(
      // # of columns
      crossAxisCount: 2,
      padding: EdgeInsets.all(16.0),
      childAspectRatio: 8.0/9.0,
      children: _buildPhotos(context),
    );
  }
}
