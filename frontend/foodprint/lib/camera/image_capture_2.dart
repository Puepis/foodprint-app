import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'dart:async';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart';
import 'package:provider/provider.dart';
import 'package:geolocator/geolocator.dart';

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

  // Location
  Position _position;
  String _address;
  final Map<int, String> days = {1: "Mon.", 2:"Tues.", 3:"Wed.", 4:"Thurs.", 5:"Fri.", 6:"Sat.", 7:"Sun."};
  final Map<int, String> months = {1: "Jan.", 2:"Feb.", 3:"Mar.", 4:"Apr.", 5:"May", 6:"June", 7:"July", 8:"Aug.", 9:"Sept.", 10:"Oct.", 11: "Nov.", 12:"Dec."};

  // Fields
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _itemNameController = TextEditingController();
  String _titleText = "";
  String _priceText = "";
  String _captionText = "";

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    _captionController.dispose();
    _priceController.dispose();
    _itemNameController.dispose();
    super.dispose();
  }

  // Photo information
  _getContentString() {
    String pos = "";
    String addr = "";
    // TODO: Handle form field validation
    String name = "Name:$_titleText";
    String caption = "Caption:$_captionText";
    String price = "Price:$_priceText";
    String datetime = "DateTime:${_getDateTime()}";
    if (_position != null) pos = "Position:${_position.latitude}, ${_position.longitude}";
    if (_address != null) addr = "Address:$_address";
    return "$pos\n$addr\n$datetime\n$name\n$caption\n$price";
  }

  // Get LatLng Coordinates
  Future<void> _getLocation() async {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
    try {
      Position position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);

      setState(() {
        _position = position;
      });
      _getAddressFromLatLng(geolocator);
    } catch (e) {
      print(e);
    }
  }

  // Convert LatLng to Address
  _getAddressFromLatLng(Geolocator geolocator) async {
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          _position.latitude, _position.longitude);

      Placemark place = p[0];

      setState(() {
        _address = "${place.locality}, ${place.postalCode}, ${place.country}";
      });
    } catch (e) {
      print(e);
    }
  }

  // Format datetime
  String _getDateTime() {
    final DateTime now = new DateTime.now();
    String y = now.year.toString();
    String m = months[now.month];
    String wd = days[now.weekday];
    String d = now.day.toString();
    String h = now.hour.toString();
    String min = now.minute < 10 ? "0${now.minute.toString()}" : now.minute.toString();
    return "$wd, $m $d, $y ~ $h.$min";
  }

  // Take a photo
  Future<void> _pickImage(ImageSource source) async {
    File selected = await ImagePicker.pickImage(source: source);

    // Image file
    if (mounted) {
      // Get location
      await _getLocation();
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
    String contentString = _getContentString();
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
                FlatButton(
                  child: Icon(Icons.refresh),
                  onPressed: _clear,
                ),
                _SaveButton(imageFile: _imageFile, contents: contentString)
              ],
            ),
            Center(
              child: Column(
                children: <Widget>[
                  if (_position != null && _address != null)...[
                    Text("LAT: ${_position.latitude}, LNG: ${_position.longitude}"),
                    Text(_address)
                  ],
                  Text(_getDateTime()),
                ],
              ),
            ),
            SizedBox(height: 10.0,),
            TextField(
              controller: _itemNameController,
              decoration: InputDecoration(
                labelText: "Item Name",
              ),
              onChanged: (text) {
                setState(() {
                  _titleText = text;
                });
              },
            ),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: "Price",
              ),
              onChanged: (text) {
                setState(() {
                  _priceText = text;
                });
              },
            ),
            TextField(
              controller: _captionController,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: "Caption",
              ),
              onChanged: (text) {
                setState(() {
                  _captionText = text;
                });
              },
            ),
          ]
        ],
      );
  }
}

class _SaveButton extends StatelessWidget {
  final File imageFile;
  final String contents;
  const _SaveButton({Key key, @required this.imageFile, @required this.contents}) : super(key: key);

  Future<void> _saveImageAndContents(gallery) async {
    try {
      // Get directory where we can save the file
      final path = (await getApplicationDocumentsDirectory()).path;

      // Get filename of the image
      final String fileName = basename(imageFile.path);

      // Create folder called photos
      final photosPath = await createFolder(path, 'photos');
      final imgPath = await createFolder(photosPath, '$fileName');

      // Copy the file to the AppDoc directory
      final File localImage = await imageFile.copy('$imgPath/img.jpg');
      final File localContents = File('$imgPath/contents.txt');
      localContents.writeAsStringSync(contents);

      // Update gallery model
      gallery.addPhotoDir(Directory('$imgPath'));
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
        onPressed: () => _saveImageAndContents(gallery),
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

