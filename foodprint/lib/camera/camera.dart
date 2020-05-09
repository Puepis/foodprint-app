import 'package:flutter/material.dart';
import 'package:foodprint/camera/restaurants.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:foodprint/places_data/result.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:location/location.dart';

class Camera extends StatefulWidget {
  final String username;
  final GalleryModel gallery;
  Camera({Key key, @required this.username, @required this.gallery}) : super(key: key);
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  // Active image file
  File _imageFile;
  FileImage loadedImage;
  LocationData _position;
  List<Result> _restaurants;

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

  Future<void> _findRestaurants() async {
    _position = await Locator.getLocation();
    _restaurants = await Locator.getRestaurants(_position);
  }

  @override
  void initState() {
    super.initState();
    _findRestaurants(); // get list of restaurants
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
                    builder: (context) => RestaurantListing(
                      username: widget.username,
                      imageFile: _imageFile,
                      gallery: widget.gallery,
                      position: _position,
                      restaurants: _restaurants
                    )
                ));
              },
            ),
          ],
        ),
      )
    );
  }
}

