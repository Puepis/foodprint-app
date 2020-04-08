import 'package:flutter/material.dart';
import 'package:foodprint/models/photo.dart';
import 'package:geolocator/geolocator.dart';
import 'package:provider/provider.dart';

class ImageDetail extends StatefulWidget {
  @override
  _ImageDetailState createState() => _ImageDetailState();
}

class _ImageDetailState extends State<ImageDetail> {

  // Location
  final Map<int, String> days = {1: "Mon.", 2:"Tues.", 3:"Wed.", 4:"Thurs.", 5:"Fri.", 6:"Sat.", 7:"Sun."};
  final Map<int, String> months =
  {1: "Jan.", 2:"Feb.", 3:"Mar.", 4:"Apr.", 5:"May", 6:"June", 7:"July", 8:"Aug.", 9:"Sept.", 10:"Oct.", 11: "Nov.", 12:"Dec."};

  // Fields
  final TextEditingController _captionController = TextEditingController();
  final TextEditingController _priceController = TextEditingController();
  final TextEditingController _itemNameController = TextEditingController();

  // Get LatLng Coordinates
  Future<void> _setLocation(var photoModel) async {
    final Geolocator geolocator = Geolocator()..forceAndroidLocationManager = true;
    try {
      Position position = await geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.best);
      photoModel.coords = "${position.latitude}, ${position.longitude}";
      photoModel.address = await _getAddressFromLatLng(geolocator, position);
    } catch (e) {
      print(e);
    }
  }

  // Convert LatLng to Address
  Future<String> _getAddressFromLatLng(Geolocator geolocator, Position position) async {
    Placemark place;
    try {
      List<Placemark> p = await geolocator.placemarkFromCoordinates(
          position.latitude, position.longitude);
      place = p[0];
    } catch (e) {
      print(e);
    }
    return '${place.locality}, ${place.postalCode}, ${place.country}';
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

  void clearListeners() {
    _itemNameController.clear();
    _priceController.clear();
    _captionController.clear();
  }

  @override
  Widget build(BuildContext context) {
    var photoModel = Provider.of<PhotoModel>(context);
    _setLocation(photoModel);
    photoModel.datetime = _getDateTime();

    if (photoModel.saved) clearListeners();
    return Column(
      children: <Widget>[
        TextField(
          controller: _itemNameController,
          decoration: InputDecoration(
            labelText: "Item Name",
          ),
          onChanged: (text) {
            photoModel.name = text;
          },
        ),
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
