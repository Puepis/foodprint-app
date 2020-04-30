
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:foodprint/models/photo.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class SaveButton extends StatelessWidget {
  final File imageFile;
  final GalleryModel gallery;
  const SaveButton({Key key, @required this.imageFile, @required this.gallery}) : super(key: key);

  Future<void> _saveImageAndContents(GalleryModel gallery, PhotoModel photo) async {
    try {
      // Get directory where we can save the file
      final path = (await getApplicationDocumentsDirectory()).path;

      // Get filename of the image
      final String fileName = basename(imageFile.path);
      final photosPath = await createFolder(path, 'photos');
      final imgPath = await createFolder(photosPath, '$fileName');

      String contents = "LatLng: ${photo.coords}\nAddress: ${photo.address}\nDateTime: ${photo.datetime}\nName: ${photo.name}\nPrice: ${photo.price}\nCaption: ${photo.caption}";

      // Copy the file to the AppDoc directory
      await imageFile.copy('$imgPath/img.jpg');
      final File localContents = File('$imgPath/contents.txt');
      localContents.writeAsStringSync(contents);

      // Update models
      gallery.addPhotoDir(Directory('$imgPath'));
      photo.setSaved();
    } catch (e) {
      print(e);
    }

    // Display toast
    Fluttertoast.showToast(
      msg: "Image saved!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      fontSize: 16.0,
    );
  }

  // Create new folder in AppDoc, returns the path
  Future<String> createFolder(String path, String folderName) async {
    final Directory _folder = new Directory('$path/$folderName/');

    // If folder exists, return path
    if (await _folder.exists()) {
      return _folder.path;
    } else { // Create new folder, then return
      final Directory _newFolder = await _folder.create(recursive: true);
      return _newFolder.path;
    }
  }

  @override
  Widget build(BuildContext context) {
    try {
      print("Building button");
      if (gallery == null) {
        print("Gallery null");
      }
      var photoModel = Provider.of<PhotoModel>(context);
      return FlatButton(
        child: Icon(Icons.save_alt),
        onPressed: () {
          _saveImageAndContents(gallery, photoModel);
          Navigator.pop(context);
        },
      );
    } catch (e) {
      print(e);
      return FlatButton(
        child: Icon(Icons.save_alt),
        onPressed: () => {},
      );
    }
  }
}