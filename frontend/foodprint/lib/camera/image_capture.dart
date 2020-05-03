import 'package:flutter/material.dart';
import 'package:foodprint/camera/save_button.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:foodprint/models/photo.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:provider/provider.dart';

class ImageCapture extends StatefulWidget {
  final GalleryModel gallery;
  ImageCapture({Key key, @required this.gallery}) : super(key: key);
  @override
  _ImageCaptureState createState() => _ImageCaptureState();
}

class _ImageCaptureState extends State<ImageCapture> {
  // Active image file
  File _imageFile;

  // Take a photo
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

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

  int getSecondsSinceEpoch() {
    var ms = (new DateTime.now()).millisecondsSinceEpoch;
    return (ms / 1000).round();
  }

  @override
  Widget build(BuildContext context) {
    // Launch camera
    if (_imageFile == null) _pickImage(ImageSource.camera);

    return Scaffold(
      body: ChangeNotifierProvider(
        create: (context) => PhotoModel(),
        child: Container(
          alignment: Alignment(-1.0, 0.9),
          decoration: _imageFile == null ? BoxDecoration() : BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fitHeight,
              image: FileImage(_imageFile)
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
              SaveButton(imageFile: _imageFile, gallery: widget.gallery)
            ],
          ),
        ),
      ),
    );
  }
}

