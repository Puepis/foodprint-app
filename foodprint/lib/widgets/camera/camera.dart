import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/places_data/result.dart';
import 'package:foodprint/service/locator.dart';
import 'package:foodprint/widgets/camera/restaurant_listing.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';

class Camera extends StatefulWidget {
  final UserModel user;
  const Camera({Key key, @required this.user}) : super(key: key);
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File _imageFile;
  FileImage loadedImage;
  LatLng _location;
  List<Result> _restaurants;

  Future<void> _takePhoto(ImageSource source, BuildContext context) async {
    final _picker = ImagePicker();
    PickedFile image = await _picker.getImage(source: source, imageQuality: 70);
    if (image == null) { // Back button pressed
      Navigator.pop(context);
      return;
    }

    File imageFile = File(image.path);
    loadedImage = FileImage(imageFile);
    await precacheImage(loadedImage, context); // precache the image

    // Image file
    if (mounted) {
      setState(() {
        _imageFile = imageFile;
      });
      _findRestaurants();
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
    if (mounted) setState(() {});
  }

  Widget customButton(BuildContext context) {
    return Container(
      width: 60,
      height: 60,
      child: Material(
          type: MaterialType.transparency,
          child: Ink(
            decoration: BoxDecoration(
              color: Colors.blue,
              shape: BoxShape.circle,
            ),
            child: InkWell(
              borderRadius: BorderRadius.circular(1000.0),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(
                  builder: (context) => RestaurantListing(
                    user: widget.user,
                    imageFile: _imageFile,
                    restaurants: _restaurants
                  )
                )).then((result) {
                  bool saved = result as bool;
                  if (saved != null) {
                    Navigator.of(context).pop(result); // pop back to home
                  }
                });
              },
              child: Icon(
                Icons.navigate_next,
                size: 50.0,
                color: Colors.white,
              ),
            ),
          )
      ),
    );
  }

  // Show confirmation dialogj
  Future<bool> _onWillPop() async {
    return (await showDialog(
      context: context,
      builder: (context) => Dialog(
        backgroundColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20.0)
        ),
        child: Container(
          height: 200,
          padding: const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 5.0),
                child: Text(
                  "Are you sure you want to \n discard your photo?",
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14.0
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              ButtonTheme(
                minWidth: 200,
                height: 50,
                child: FlatButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0)
                  ),
                  color: Colors.black87,
                  child: Text(
                    "Confirm",
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                  onPressed: () => Navigator.of(context).pop(true),
                ),
              ),
              const SizedBox(height: 5.0,),
              FlatButton(
                child: const Text(
                  "Cancel",
                  style: const TextStyle(
                    fontSize: 16.0,
                    color: Colors.black
                  ),
                ),
                onPressed: () => Navigator.of(context).pop(false),
              )
            ],
          ),
        ),
      )
    )) ?? false;
  }
  
  @override
  Widget build(BuildContext context) {
    if (_imageFile == null) _takePhoto(ImageSource.camera, context);

    if (_imageFile == null) {
      return Scaffold(
      body: const Center(
        child: CircularProgressIndicator(),
      ),
    );
    } else {
      return WillPopScope(
        onWillPop: _onWillPop,
        child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight,
                  image: loadedImage
              )
          ),
          child: Stack(
            children: [
              Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  icon: Icon(Icons.cancel, color: Colors.red, size: 50.0,),
                  onPressed: () => Navigator.pop(context),
                )
              ),
              Positioned(
                left: 10,
                bottom: 20,
                child: IconButton(
                  icon: Icon(Icons.refresh, color: Colors.white, size: 40.0,),
                  onPressed: _clear,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 30,
                child: _restaurants != null ? customButton(context) : SpinKitRing(
                  color: Colors.blue,
                  size: 40.0,
                )
              ),
            ]
          ),
        ),
    ),
      );
    }
  }
}

