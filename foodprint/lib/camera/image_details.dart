import 'dart:io';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:foodprint/models/photo.dart';
import 'package:foodprint/places_data/result.dart';
import 'package:location/location.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';

class ImageDetail extends StatefulWidget {
  final LocationData position;
  final Result restaurant;
  final File imageFile;
  final GalleryModel gallery;
  ImageDetail({Key key, @required this.imageFile, @required this.gallery,
    @required this.restaurant, @required this.position}) : super(key: key);
  @override
  _ImageDetailState createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {

  // Date
  final Map<int, String> days = {1: "Mon.", 2:"Tues.", 3:"Wed.", 4:"Thurs.", 5:"Fri.", 6:"Sat.", 7:"Sun."};
  final Map<int, String> months =
  {1: "Jan.", 2:"Feb.", 3:"Mar.", 4:"Apr.", 5:"May", 6:"June", 7:"July", 8:"Aug.", 9:"Sept.", 10:"Oct.", 11: "Nov.", 12:"Dec."};

  // Fields
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _itemNameController = TextEditingController();

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

  Future<void> _saveImageAndContents(GalleryModel gallery, PhotoModel photo) async {
    try {
      // Get directory where we can save the file
      final path = (await getApplicationDocumentsDirectory()).path;

      // Get filename of the image
      final String fileName = basename(widget.imageFile.path);
      final photosPath = await createFolder(path, 'photos');
      final imgPath = await createFolder(photosPath, '$fileName');

      String contents = "LatLng: ${photo.coords}\nDateTime: ${photo.datetime}\nName: ${photo.name}\nPrice: ${photo.price}\nCaption: ${photo.caption}";

      // Copy the file to the AppDoc directory
      await widget.imageFile.copy('$imgPath/img.jpg');
      final File localContents = File('$imgPath/contents.txt');
      localContents.writeAsStringSync(contents);

      // Update models
      gallery.addPhotoDir(Directory('$imgPath'));
    } catch (e) {
      print(e);
    }

    // Display toast
    Fluttertoast.showToast(
      msg: "Image saved!",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
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
    PhotoModel photoModel = Provider.of<PhotoModel>(context);
    photoModel.datetime = _getDateTime();
    return Scaffold(
      body: Container(
        child: Column(
          children: <Widget>[
            Text("Fill in the details!"),
            TextField(
              controller: _itemNameController,
              decoration: InputDecoration(
                labelText: "Item Name",
              ),
              onChanged: (text) {
                photoModel.name = text;
              },
            ),
            // TODO: Price input validation
            TextField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: "Price",
              ),
              onChanged: (text) {
                photoModel.price = text;
              },
            ),
            TextField(
              controller: _captionController,
              maxLines: 10,
              decoration: InputDecoration(
                labelText: "Caption",
              ),
              onChanged: (text) {
                photoModel.caption = text;
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Save contents
          _saveImageAndContents(widget.gallery, photoModel);
          Navigator.pop(context); // go back to map
        },
      ),
    );
  }

  @override
  void dispose() {
    _captionController.dispose();
    _priceController.dispose();
    _itemNameController.dispose();
    super.dispose();
  }
}
