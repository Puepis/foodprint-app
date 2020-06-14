import 'package:flutter/material.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/places_data/result.dart';
import 'package:foodprint/service/locator.dart';
import 'package:foodprint/widgets/camera/restaurant_listing.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:location/location.dart';

class Camera extends StatefulWidget {
  final UserModel user;
  const Camera({Key key, @required this.user}) : super(key: key);
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  // Active image file
  File _imageFile;
  FileImage loadedImage;
  LatLng _location;
  List<Result> _restaurants;

  // Take a photo
  Future<void> _pickImage(ImageSource source, BuildContext context) async {
    File imageFile = await ImagePicker.pickImage(source: source, imageQuality: 70);
    if (imageFile == null) { // Image not taken
      Navigator.pop(context); // TODO: change this
      return;
    }

    loadedImage = FileImage(imageFile);
    await precacheImage(loadedImage, context); // precache the image

    // Image file
    if (mounted) {
      setState(() {
        _imageFile = imageFile;
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

  // Search for nearby restaurants
  Future<void> _findRestaurants() async {
    _location = await Geolocator.getLocation();
    _restaurants = await Geolocator.getRestaurants(_location);
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _findRestaurants(); // get list of restaurants
  }

  @override
  Widget build(BuildContext context) {

    // Launch widgets.camera
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
              child: Icon(Icons.cancel),
              onPressed: () => Navigator.pop(context),
            ),
            RaisedButton(
              child: Icon(Icons.refresh),
              onPressed: _clear,
            ),
            if (_restaurants != null) RaisedButton(
              child: Icon(Icons.navigate_next),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => RestaurantListing(
                      user: widget.user,
                      imageFile: _imageFile,
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

