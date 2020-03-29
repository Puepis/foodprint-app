import 'package:flutter/material.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:http/http.dart' as http;
import 'package:foodprint/auth/tokens.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';

class ImageCapture extends StatefulWidget {
  ImageCapture({Key key, @required this.id}) : super(key: key);
  // User id - inherited from HomePage
  final int id;

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
    if (mounted) setState(() => _imageFile = selected);
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
    if (mounted) setState(() {_imageFile = cropped ?? _imageFile;});
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

    return ListView(
        children: <Widget>[
          if (_imageFile != null) ...[
            Image.file(_imageFile),
            Row(
              children: <Widget>[
                FlatButton(
                  child: Icon(Icons.crop),
                  onPressed: _cropImage,
                ),
                // TODO: Remove this
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                ),
                _SaveButton(imageFile: _imageFile)
              ],
            ),
          ]
        ],
      );
  }
}

class _SaveButton extends StatelessWidget {
  final File imageFile;
  const _SaveButton({Key key, @required this.imageFile}) : super(key: key);

  Future<void> _saveImages(gallery) async {
    try {
      // Get directory where we can save the file
      final path = (await getApplicationDocumentsDirectory()).path;

      // Get filename of the image
      final String fileName = basename(imageFile.path);

      // Create folder called photos
      final newPath = await createFolder(path, 'photos');

      // Copy the file to the AppDoc directory
      final File localImage = await imageFile.copy('$newPath/$fileName');

      // Update gallery model
      gallery.addPhoto(localImage);
    } catch (e) {
      print(e);
    }

    // Display toast
    Fluttertoast.showToast(
      msg: "Image saved!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIos: 1,
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
      var gallery = Provider.of<GalleryModel>(context);
      return FlatButton(
        child: Icon(Icons.save_alt),
        onPressed: () => _saveImages(gallery),
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

