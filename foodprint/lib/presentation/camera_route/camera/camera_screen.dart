import 'dart:async';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/presentation/camera_route/camera/camera.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:image_picker/image_picker.dart';

/// The widget that handles photo capturing.
/// 
/// The [image_picker] library is used to take a photo. Once the photo is 
/// captured, it is displayed in the [DisplayPhoto] widget.
class Camera extends StatefulWidget {
  final FoodprintEntity oldFoodprint;
  final LatLng location;
  final JWT token;

  const Camera(
      {Key key,
      @required this.location,
      @required this.oldFoodprint,
      @required this.token})
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
            : MultiBlocProvider(
                providers: [
                    BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                    BlocProvider.value(value: context.bloc<FoodprintBloc>())
                  ],
                child: DisplayPhoto(
                  latitude: widget.location.latitude,
                  longitude: widget.location.longitude,
                  loadedImage: loadedImage,
                  imageFile: _imageFile,
                  oldFoodprint: widget.oldFoodprint,
                  token: widget.token,
                )));
  }

  Future<void> _takePhoto(ImageSource source, BuildContext context) async {
    final _picker = ImagePicker();
    final PickedFile image =
        await _picker.getImage(source: source, imageQuality: 70);
    if (image == null) {
      Navigator.pop(context); // back button pressed
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
      ),
    );
  }
}
