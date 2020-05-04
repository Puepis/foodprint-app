import 'dart:convert' show json, ascii, base64;
import 'dart:io';
import 'package:foodprint/camera/image_capture.dart';
import 'package:foodprint/auth/login_page.dart';
import 'package:foodprint/auth/tokens.dart';
import 'package:foodprint/gallery/gallery.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:foodprint/map.dart';
import 'package:location/location.dart';


class HomePage extends StatefulWidget {
  // Constructor
  HomePage(this.jwt, this.payload);

  // Web Token and Payload
  final String jwt;
  final Map<String, dynamic> payload;

  // Factory constructor - decode the payload
  factory HomePage.construct(String jwt) =>
      HomePage(jwt, json.decode(ascii.decode(base64.decode(base64.normalize(jwt.split(".")[1])))));

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _selectedPage = 0;
  List<FileSystemEntity> _photoDirs = [];
  LatLng _currentPos;

  // Log out
  Future<bool> attemptLogout(String username) async {
    var res = await http.post(
        "$SERVER_IP/api/users/logout",
        body: {
          "username": username
        }
    );
    return res.statusCode == 200;
  }

  // Render widget
  Widget _getPage(int selected) {
    switch(selected) {
      case 0: { return FoodMap(initialPos: _currentPos); }
      break;
      case 2: { return Gallery(); }
      break;
      default: { return Text("Default"); }
      break;
    }
  }

  // Header
  Widget appBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Text('Foodprint'),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.subdirectory_arrow_right),
          onPressed: () async {
            // Log out
            bool successful = await attemptLogout(widget.payload['username']);
            if (successful) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            }
          },
        )
      ],
    );
  }

  // Nav bar
  Widget navBar() {
    return Consumer<GalleryModel>(
      builder: (context, galleryModel, child) {
        return BottomNavigationBar(
            currentIndex: _selectedPage,
            onTap: (int index) {
              if (index == 1) { // Camera
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => ImageCapture(gallery: galleryModel)
                ));
              }
              else {
                setState(() {
                  _selectedPage = index;
                });
              }
            },
            items: [
              BottomNavigationBarItem(
                icon: Icon(Icons.map),
                title: Text('Map'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.camera),
                title: Text('Camera'),
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.terrain),
                title: Text('Gallery'),
              ),
            ],
          );
        }
    );
  }

  Widget buildHomePage(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GalleryModel(_photoDirs),
      child: Scaffold(
          appBar: appBar(context),
          body: _getPage(_selectedPage),
          bottomNavigationBar: navBar()
        ),
    );
  }

  // Get all the stored photos
  void _getPhotos() async {
    String path = (await getApplicationDocumentsDirectory()).path;
    setState(() {
      // TODO: FileSystemException Error
      _photoDirs = Directory('$path/photos/').listSync();
    });
  }

  // Set LatLng coordinates
  void _setLocation() async {
    final Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData pos;

    // Check service
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    // Check permissions
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    print("Initializing position...");
    pos = await location.getLocation();
    print("${pos.latitude}, ${pos.longitude}");
    print("Accuracy: ${pos.accuracy}m");
    setState(() {
      _currentPos = LatLng(pos.latitude, pos.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
    _getPhotos(); // update gallery with photos
    _setLocation(); // set current location
  }

  @override
  Widget build(BuildContext context) =>
    Container(
      child: FutureBuilder(
        future: http.read('$SERVER_IP/api/users/data', headers: {"Authorization": widget.jwt}),
          builder: (context, snapshot) =>
            snapshot.hasData ?  buildHomePage(context):
              // Token expired
              snapshot.hasError ? LoginPage() : CircularProgressIndicator()
        ),
    );
}