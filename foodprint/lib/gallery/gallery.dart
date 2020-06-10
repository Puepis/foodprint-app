
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/gallery/image.dart';
import 'package:foodprint/models/gallery_model.dart';
import 'package:foodprint/models/photo_detail.dart';
import 'package:foodprint/service/storage.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class Gallery extends StatelessWidget {

  // Get image time taken from directory
  int getTimeTaken(FileSystemEntity dir) {
    String name = basename(dir.path);
    return int.parse(name.split("-")[0]);
  }

  List<Widget> _buildPhotos(BuildContext context) {
    // Grab state from model
    var gallery = Provider.of<GalleryModel>(context);
    List<FileSystemEntity> photoDirs = gallery.photoDirs;

    // No photos yet
    if (photoDirs == null || photoDirs.isEmpty){
      return const <Card>[];
    }

    // Sort directories from newest to oldest
    photoDirs.sort((a, b) => getTimeTaken(b).compareTo(getTimeTaken(a)));

    // Render photos
    return photoDirs.map((dir) {
      // Files
      File imgFile = PhotoManager.openImgFile(dir);
      File contentsFile = PhotoManager.openContentFile(dir);

      // Disassemble contents
      PhotoDetail contents = PhotoManager.getContents(contentsFile);

      return GestureDetector(
        onTap: () => Navigator.push(context, MaterialPageRoute(
          builder: (context) => FullImage(imageFile: imgFile, contents: contents)
        )),
        child: Card(
          elevation: 0.0,
          clipBehavior: Clip.antiAlias,
          child: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: FileImage(imgFile),
                fit: BoxFit.cover
              )
            ),
          ),
        ),
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2, // columns
      crossAxisSpacing: 10,
      mainAxisSpacing: 10,
      padding: EdgeInsets.all(10.0),
      children: _buildPhotos(context),
    );
  }
}
