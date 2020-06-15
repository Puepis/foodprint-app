import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/places_data/result.dart';
import 'package:foodprint/widgets/auth/tokens.dart';
import 'package:http/http.dart' as http;
import 'package:path/path.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class ImageDetail extends StatefulWidget {
  final UserModel user;
  final Result restaurant;
  final File imageFile;
  ImageDetail({Key key, @required this.user, @required this.imageFile,
    @required this.restaurant}) : super(key: key);
  @override
  _ImageDetailState createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {
  final _formKey = GlobalKey<FormState>();

  bool saving = false;
  String _itemName = "";
  String _price = "";
  String _caption = "";
  int secondsSinceEpoch;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(120.0),
          child: AppBar(
            centerTitle: true,
            automaticallyImplyLeading: false,
            flexibleSpace: Center(
              child: Text(
                "Fill in the details!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 30,
                ),
              ),
            ),
          ),
        ),
        body: Container(
          margin: EdgeInsets.fromLTRB(7.5, 10.0, 7.5, 0),
          padding: EdgeInsets.symmetric(horizontal: 5.0),
          child: Form(
            key: _formKey,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  TextFormField(
                    decoration: InputDecoration(
                      icon: Icon(Icons.restaurant_menu),
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
                      keyboardType: TextInputType.multiline,
                      maxLines: 5,
                      maxLength: 200,
                      decoration: InputDecoration(
                        icon: Icon(Icons.rate_review),
                        labelText: 'Comments',
                      ),
                      onSaved: (String value) {
                        _caption = value.trim();
                      },
                      validator: (String value) {
                        return null;
                      }
                  ),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: EdgeInsets.symmetric(vertical: 16.0),
                      child: saving ? SpinKitThreeBounce(
                        color: Colors.blue,
                        size: 15.0
                        ) : FloatingActionButton.extended(
                        label: Text(
                          'SAVE',
                          style: TextStyle(
                              fontSize: 16.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        icon: Icon(Icons.save_alt),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save(); // save fields
                            _saveImage(context); // save contents
                            setState(() {
                              saving = true;
                            });
                          }
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        )
    );
  }

  // Format datetime
  String _getTimestamp() {
    final DateTime now = new DateTime.now();
    secondsSinceEpoch = (now.millisecondsSinceEpoch / 1000).round();
    String y = now.year.toString();
    String m = now.month < 10 ? "0${now.month}" : now.month.toString();
    String d = now.day.toString();
    String h = now.hour.toString();
    String min = now.minute < 10 ? "0${now.minute}" : now.minute.toString();
    String second = now.second < 10 ? "0${now.second}" : now.second.toString();
    return "$y-$m-$d $h:$min:$second-04"; // TODO: handle timezone
  }

  Future<void> _saveImage(BuildContext context) async {
    String timestamp = _getTimestamp();
    try {

      // Get filename of the image
      final String fileName = basename(widget.imageFile.path);
      final String imgPath = '${widget.user.id}/photos/$secondsSinceEpoch-$fileName';
      final Uint8List imgBytes = widget.imageFile.readAsBytesSync();

      // Image information
      String body = jsonEncode({
        "userId": widget.user.id.toString(),
        "image": {
          "path": imgPath,
          "data": imgBytes.toString(),
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
        FoodprintPhoto newPhoto = FoodprintPhoto(
            storagePath: imgPath,
            imgBytes: imgBytes,
            name: _itemName,
            price: double.parse(_price),
            caption: _caption,
            restaurantId: widget.restaurant.placeId,
            restaurantName: widget.restaurant.name,
            restaurantRating: widget.restaurant.rating,
            timestamp: timestamp,
            latitude: widget.restaurant.geometry.location.lat,
            longitude: widget.restaurant.geometry.location.long
        );

        widget.user.addPhoto(newPhoto); // update foodprint
        Navigator.pop(context, true); // pop result back
      }
      else if (res.statusCode == 401) {
       // TODO: Handle 401 error
        setState(() {
          saving = false;
        });

        // Display toast
        Fluttertoast.showToast(
          msg: res.body,
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM,
          timeInSecForIosWeb: 1,
          fontSize: 16.0,
        );
      }
    } catch (e) {
      print(e);
    }
  }
}
