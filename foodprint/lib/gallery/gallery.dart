
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class Gallery extends StatelessWidget {

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

    // Unwrap contents and populate contents Map
    Map<String, String> _getContents(File file) {
      Map<String, String> contents = new Map();
      String contentStr = file.readAsStringSync();
      List<String> contentsList = contentStr.split("\n");
      contentsList.forEach((str) {
        print("Field: $str");
        List<String> info = str.split(":");
        String category = info[0].toLowerCase();
        String information = info[1];
        contents[category] = information;
      });
      return contents;
    }
    // Render photos
    return photoDirs.map((dir) {
      // Files
      File imgFile = File('${dir.path}/img.jpg');
      File contentsFile = File('${dir.path}/contents.txt');

      // Disassemble contents
      Map<String, String> contents = _getContents(contentsFile);

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
                      contents.isEmpty ? "" : "Title: ${contents['name']}",
                      maxLines: 1,
                    ),
                    SizedBox(height: 4.0),
                    // TODO: format currency
                    Text(
                      contents.isEmpty ? "" : "Price: ${formatter.format(double.parse(contents['price']))}",
                    ),
                    SizedBox(height: 4.0),
                    Text(
                      contents.isEmpty ? "" : "Caption: ${contents['caption']}",
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
