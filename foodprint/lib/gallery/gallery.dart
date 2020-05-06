
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:foodprint/models/photo_detail.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Gallery extends StatelessWidget {

  // Unwrap content
  PhotoDetail _getContents(File file) {
    Map<String, dynamic> photoDetail = jsonDecode(file.readAsStringSync()); // decode JSON string
    return PhotoDetail.fromJson(photoDetail); // create instance
  }

  List<Card> _buildPhotos(BuildContext context) {

    // Grab state from model
    var gallery = Provider.of<GalleryModel>(context);
    List<FileSystemEntity> photoDirs = gallery.photoDirs;

    // No photos yet
    if (photoDirs == null || photoDirs.isEmpty){
      return const <Card>[];
    }

    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString()
    );

    // Render photos
    return photoDirs.map((dir) {
      // Files
      File imgFile = File('${dir.path}/img.jpg');
      File contentsFile = File('${dir.path}/contents.json');

      // Disassemble contents
      PhotoDetail contents = _getContents(contentsFile);

      return Card(
        elevation: 0.0,
        clipBehavior: Clip.antiAlias,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            AspectRatio(
              aspectRatio: 18.0 / 11.0,
              child: Image.file(imgFile),
            ),
            Expanded(
              child: Padding(
                padding: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      "Item: ${contents.name}",
                      maxLines: 1,
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "Price: ${formatter.format(contents.price)}",
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      "Caption: ${contents.caption}",
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
      crossAxisCount: 2, // columns
      padding: EdgeInsets.all(5.0),
      childAspectRatio: 8.0/9.0,
      children: _buildPhotos(context),
    );
  }
}
