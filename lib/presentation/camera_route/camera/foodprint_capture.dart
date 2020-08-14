import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/restaurants/nearby_search/restaurant_search_bloc.dart';
import 'package:foodprint/injection.dart';
import 'package:image_picker/image_picker.dart';

import 'display_photo.dart';

/// The widget that handles photo capturing.
///
/// The [image_picker] library is used to take a photo. Once the photo is
/// captured, it is displayed in the [DisplayPhoto] widget.
class FoodprintCapture extends StatefulWidget {
  static const routeName = "camera/";
  final VoidCallback onDismiss;
  const FoodprintCapture({Key key, @required this.onDismiss})
      : assert(onDismiss != null),
        super(key: key);
  @override
  _FoodprintCaptureState createState() => _FoodprintCaptureState();
}

class _FoodprintCaptureState extends State<FoodprintCapture> {
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
            : BlocProvider(
                create: (context) => getIt<RestaurantSearchBloc>(),
                child: DisplayPhoto(
                    loadedImage: loadedImage,
                    imageFile: _imageFile,
                    onSaveOrAbort: widget.onDismiss),
              ));
  }

  Future<void> _takePhoto(ImageSource source, BuildContext context) async {
    final _picker = ImagePicker();
    PickedFile image;
    try {
      image = await _picker.getImage(source: source, imageQuality: 70);
      if (image == null) return widget.onDismiss();
    } on PlatformException {
      return widget.onDismiss();
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
      child: CircularProgressIndicator(),
    );
  }
}
