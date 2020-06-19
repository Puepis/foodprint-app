import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprint/models/places_data/restaurant_result.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/service/locator.dart';
import 'package:foodprint/widgets/camera/restaurant_listing.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

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
  List<RestaurantResult> _restaurants;

  Future<void> _takePhoto(ImageSource source, BuildContext context) async {
    final _picker = ImagePicker();
    final PickedFile image = await _picker.getImage(source: source, imageQuality: 70);
    if (image == null) { // Back button pressed
      Navigator.pop(context);
      return;
    }

    final File imageFile = File(image.path);
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
    final File cropped = await ImageCropper.cropImage(
      sourcePath: _imageFile.path,
      androidUiSettings: const AndroidUiSettings(
          toolbarTitle: 'Cropper',
          toolbarColor: Colors.deepOrange,
          toolbarWidgetColor: Colors.white,
          initAspectRatio: CropAspectRatioPreset.original,
          lockAspectRatio: false),
    );
    if (mounted) {
      setState(() {
        _imageFile = cropped;
      });
    }
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
            decoration: const BoxDecoration(
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
                  final bool saved = result as bool;
                  if (saved != null) {
                    Navigator.of(context).pop(result); // pop back to home
                  }
                });
              },
              child: const Icon(
                Icons.navigate_next,
                size: 50.0,
                color: Colors.white,
              ),
            ),
          )
      ),
    );
  }

  // Show confirmation dialog
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
            children: [
              const Padding(
                padding: EdgeInsets.only(top: 5.0),
                child: Text(
                  "Are you sure you want to \n discard your photo?",
                  textAlign: TextAlign.center,
                  style: TextStyle(
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
                  onPressed: () => Navigator.of(context).pop(true),
                  child: const Text(
                    "Confirm",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                      fontWeight: FontWeight.bold
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 5.0,),
              FlatButton(
                onPressed: () => Navigator.of(context).pop(false),
                child: const Text(
                  "Cancel",
                  style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.black
                  ),
                ),
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
      return const Scaffold(
      body: Center(
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
                  icon: const Icon(Icons.cancel, color: Colors.red, size: 50.0,),
                  onPressed: () => Navigator.pop(context),
                )
              ),
              Positioned(
                left: 10,
                bottom: 20,
                child: IconButton(
                  icon: const Icon(Icons.refresh, color: Colors.white, size: 40.0,),
                  onPressed: _clear,
                ),
              ),
              Positioned(
                bottom: 20,
                right: 30,
                child: _restaurants != null ? customButton(context) : const SpinKitRing(
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

