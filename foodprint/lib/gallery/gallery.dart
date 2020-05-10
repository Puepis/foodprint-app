
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/gallery/image.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:foodprint/models/photo_detail.dart';
import 'package:provider/provider.dart';

class Gallery extends StatelessWidget {

  // Unwrap content
  PhotoDetail _getContents(File file) {
    Map<String, dynamic> photoDetail = jsonDecode(file.readAsStringSync()); // decode JSON string
    return PhotoDetail.fromJson(photoDetail); // create instance
  }

  List<Widget> _buildPhotos(BuildContext context) {
    // Grab state from model
    var gallery = Provider.of<GalleryModel>(context);
    List<FileSystemEntity> photoDirs = gallery.photoDirs;

    // No photos yet
    if (photoDirs == null || photoDirs.isEmpty){
      return const <Card>[];
    }

    // Render photos
    return photoDirs.map((dir) {
      // Files
      File imgFile = File('${dir.path}/img.jpg');
      File contentsFile = File('${dir.path}/contents.json');

      // Disassemble contents
      PhotoDetail contents = _getContents(contentsFile);

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
