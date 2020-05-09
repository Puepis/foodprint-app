import 'dart:convert';
import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:foodprint/models/photo_detail.dart';
import 'package:foodprint/places_data/result.dart';
import 'package:location/location.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageDetail extends StatefulWidget {
  final String username;
  final LocationData position;
  final Result restaurant;
  final File imageFile;
  final GalleryModel gallery;
  ImageDetail({Key key, @required this.username, @required this.imageFile, @required this.gallery,
    @required this.restaurant, @required this.position}) : super(key: key);
  @override
  _ImageDetailState createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {

  final _formKey = GlobalKey<FormState>();

  // Date
  final Map<int, String> days = {1: "Mon.", 2:"Tues.", 3:"Wed.", 4:"Thurs.", 5:"Fri.", 6:"Sat.", 7:"Sun."};
  final Map<int, String> months =
  {1: "Jan.", 2:"Feb.", 3:"Mar.", 4:"Apr.", 5:"May", 6:"June", 7:"July", 8:"Aug.", 9:"Sept.", 10:"Oct.", 11: "Nov.", 12:"Dec."};

  String _itemName = "";
  String _price = "";
  String _caption = "";

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

  Future<void> _saveImageAndContents() async {
    final pos= widget.position;
    final dt = _getDateTime();
    try {
      // Get directory where we can save the file
      final path = (await getApplicationDocumentsDirectory()).path;

      // Get filename of the image
      final String fileName = basename(widget.imageFile.path);
      final imgPath = await createFolder(path, '${widget.username}/photos/$fileName');

      PhotoDetail contents = PhotoDetail(
        name: _itemName,
        price: double.parse(_price),
        caption: _caption,
        restaurantName: widget.restaurant.name,
        rating: widget.restaurant.rating,
        datetime: dt,
        latitude: pos.latitude,
        longitude: pos.longitude
      );

      String json = jsonEncode(contents); // convert to json string

      // Copy the file to the AppDoc directory
      await widget.imageFile.copy('$imgPath/img.jpg');
      final File localContents = File('$imgPath/contents.json');
      localContents.writeAsStringSync(json);

      // Update gallery model
      widget.gallery.addPhotoDir(Directory('$imgPath'));
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
    return Scaffold(
      appBar: AppBar(
        title: Text("Fill in the details!"),
      ),
      body: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(
                icon: Icon(Icons.fastfood),
                hintText: 'What are you eating/drinking?',
                labelText: 'Item Name',
              ),
              onSaved: (String value) {
                _itemName = value.trim();
              },
              validator: (String value) {
                return value.isEmpty ? 'Please enter the name of the item' : null;
              },
            ),
            SizedBox(height: 10.0,),
            TextFormField(
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                icon: Icon(Icons.attach_money),
                hintText: 'How much does it cost?',
                labelText: 'Price',
              ),
              onSaved: (String value) {
                _price = value.trim();
              },
              validator: (String value) {
                return value.isEmpty ? 'Please enter the price' : null;
              },
            ),
            SizedBox(height: 10.0,),
            TextFormField(
                decoration: InputDecoration(
                  icon: Icon(Icons.description),
                  hintText: 'Any comments?',
                  labelText: 'Caption',
                ),
                onSaved: (String value) {
                  _caption = value.trim();
                },
                validator: (String value) {
                  return null;
                }
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 16.0),
              child: FloatingActionButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    _formKey.currentState.save(); // save fields
                    _saveImageAndContents(); // save contents
                    int count = 0;
                    Navigator.popUntil(context, (route) {
                      return count++ == 3; // pop back 3 times
                    });
                  }
                },
                child: Icon(Icons.save_alt),
              ),
            )
          ],
        ),
      )
    );
  }
}
