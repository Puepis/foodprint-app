import 'package:flutter/material.dart';
import 'package:foodprint/camera/restaurant_listing.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class ImageCapture extends StatefulWidget {
  final GalleryModel gallery;
  ImageCapture({Key key, @required this.gallery}) : super(key: key);
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  // Active image file
  File _imageFile;
  FileImage loadedImage;

  // Take a photo
  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    File selected = await ImagePicker.pickImage(source: source);
    if (selected == null) { // Image not taken
      Navigator.pop(context);
      return;
    }

    loadedImage = FileImage(selected);
    await precacheImage(loadedImage, context); // precache the image

    // Image file
    if (mounted) {
      setState(() {
        _imageFile = selected;
      });
    }
  }

  // Cropper plugin
  Future<void> _cropImage() async {
    File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
      androidUiSettings: AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
    );
    if (mounted) setState(() {
        _imageFile = cropped;
      });
  }

  // Remove image
  void _clear() {
    if (mounted) setState(() => _imageFile = null);
  }

  @override
  Widget build(BuildContext context) {
    // Launch camera
    if (_imageFile == null) _pickImage(ImageSource.camera, context);

    return Scaffold(
      body: Container(
        alignment: Alignment(-1.0, 0.9),
        decoration: _imageFile == null ? BoxDecoration() : BoxDecoration(
            image: DecorationImage(
                fit: BoxFit.fitHeight,
                image: loadedImage
            )
        ),
        child: _imageFile == null ? Row() : Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            /*RaisedButton(
                child: Icon(Icons.crop),
                onPressed: _cropImage,
              ),*/
            RaisedButton(
              child: Icon(Icons.refresh),
              onPressed: _clear,
            ),
            RaisedButton(
              child: Icon(Icons.keyboard_arrow_right),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => RestaurantSelection(imageFile: _imageFile, gallery: widget.gallery)
                ));
              },
            ),
          ],
        ),
      )
    );
  }
}

