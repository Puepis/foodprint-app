import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodprint/auth/tokens.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/gallery_model.dart';
import 'package:foodprint/places_data/result.dart';
import 'package:path/path.dart';
import 'package:http/http.dart' as http;

class ImageDetail extends StatefulWidget {
  final int id;
  final Result restaurant;
  final File imageFile;
  final GalleryModel gallery;
  ImageDetail({Key key, @required this.id, @required this.imageFile, @required this.gallery,
    @required this.restaurant}) : super(key: key);
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
  int secondsSinceEpoch;

  // Format datetime
  String _getTimestamp() {
    final DateTime now = new DateTime.now();
    secondsSinceEpoch = (now.millisecondsSinceEpoch / 1000).round();
    String y = now.year.toString();
    String m = now.month < 10 ? "0${now.month.toString()}" : now.month.toString();
    String d = now.day.toString();
    String h = now.hour.toString();
    String min = now.minute < 10 ? "0${now.minute.toString()}" : now.minute.toString();
    String second = now.second < 10 ? "0${now.second}" : now.second.toString();
    return "$y-$m-$d $h:$min:$second-04"; // TODO: handle timezone
  }

  Future<void> _saveImage() async {
    print("Saving image");
    String timestamp = _getTimestamp();
    print(timestamp);
    try {
      // Get filename of the image
      final String fileName = basename(widget.imageFile.path);
      print(fileName);
      final imgPath = '${widget.id}/photos/$secondsSinceEpoch-$fileName';
      print(imgPath);
      final Uint8List imgData = widget.imageFile.readAsBytesSync();

      String body = jsonEncode({
        "userId": widget.id.toString(),
        "image": {
          "path": imgPath,
          "data": imgData.toString(),
          "details": {
            "name": _itemName,
            "price": _price,
            "caption": _caption,
            "timestamp": timestamp,
          },
          "location": {
            "id": widget.restaurant.placeId,
            "name": widget.restaurant.name,
            "rating": widget.restaurant.rating.toString(),
            "lat": widget.restaurant.geometry.location.lat.toString(),
            "lng": widget.restaurant.geometry.location.long.toString()
          }
        }
      });
      
      var res = await http.post(
        "$SERVER_IP/api/photos/save",
        headers: {
          "Content-Type": 'application/json'
        },
        body: body
      );

      if (res.statusCode == 200) {
        // Display toast
        Fluttertoast.showToast(
          msg: "Image saved!",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      } else if (res.statusCode == 401) {
        // Display toast
        Fluttertoast.showToast(
          msg: res.body,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      }

      FoodprintPhoto newPhoto = FoodprintPhoto(
        storagePath: imgPath,
        imgBytes: imgData,
        name: _itemName,
        price: double.parse(_price),
        caption: _caption,
        restaurantId: widget.restaurant.placeId,
        restaurantName: widget.restaurant.name,
        timestamp: timestamp,
        latitude: widget.restaurant.geometry.location.lat,
        longitude: widget.restaurant.geometry.location.long
      );
      // Update gallery model
      widget.gallery.addPhotoDir(newPhoto);
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fill in the details!"),
      ),
      body: Center(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
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
                      _saveImage(); // save contents

                      int count = 0;
                      Navigator.popUntil(context, (route) {
                        return count++ == 3;
                      });
                      //  Refresh foodprint map
                    }
                  },
                  child: Icon(Icons.save_alt),
                ),
              )
            ],
          ),
        ),
      )
    );
  }
}
