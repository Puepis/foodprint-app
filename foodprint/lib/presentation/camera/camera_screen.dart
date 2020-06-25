import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/presentation/camera/display_photo_page.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

class Camera extends StatefulWidget {
  final FoodprintEntity oldFoodprint;
  final UserID userID;
  final LatLng location;

  const Camera(
      {Key key,
      @required this.userID,
      @required this.location,
      @required this.oldFoodprint})
      : super(key: key);
  @override
  _CameraState createState() => _CameraState();
}

class _CameraState extends State<Camera> {
  File _imageFile;
  FileImage loadedImage;

  @override
  Widget build(BuildContext context) {
    if (_imageFile == null) {
      _takePhoto(ImageSource.camera, context);
    }

    return Scaffold(
        body: (_imageFile == null)
            ? LoadingIndicator()
            : DisplayPhoto(
                latitude: widget.location.latitude,
                longitude: widget.location.longitude,
                loadedImage: loadedImage,
                imageFile: _imageFile,
                oldFoodprint: widget.oldFoodprint,
                userID: widget.userID,
              ));
  }

  Future<void> _takePhoto(ImageSource source, BuildContext context) async {
    final _picker = ImagePicker();
    final PickedFile image =
        await _picker.getImage(source: source, imageQuality: 70);
    if (image == null) {
      // Back button pressed
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
    }
  }
}

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        backgroundColor: Colors.orange,
      ),
      
    );
  }
}