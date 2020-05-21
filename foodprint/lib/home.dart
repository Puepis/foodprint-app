import 'dart:convert' show json, ascii, base64;
import 'dart:io';
import 'package:foodprint/camera/camera.dart';
import 'package:foodprint/auth/login_page.dart';
import 'package:foodprint/auth/tokens.dart';
import 'package:foodprint/gallery/gallery.dart';
import 'package:foodprint/models/gallery_model.dart';
import 'package:foodprint/models/photo_detail.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:foodprint/service/storage.dart';
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
  Map<Restaurant, List<File>> restaurantPhotos = Map();

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
      case 0: { return FoodMap(initialPos: _currentPos, restaurantPhotos: restaurantPhotos); }
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
      centerTitle: true,
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
                    builder: (context) => Camera(
                      username: widget.payload['username'],
                      gallery: galleryModel
                    )
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
                title: Text('My Foodprint'),
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

    dynamic restaurantVisited(Restaurant res, Map photos) {
    for (Restaurant restaurant in photos.keys) {
      if (res.id.compareTo(restaurant.id) == 0) {
        return restaurant;
      }
    }
    return null;
  }

  void _loadUserFoodprint() async {
    // Get folders
    String path = (await getApplicationDocumentsDirectory()).path;

    try {
      _photoDirs = Directory('$path/${widget.payload['username']}/photos/').listSync();
    }
    on FileSystemException {
      print("Directory not initialized");
    }

    // Unwrap contents, get each unique restaurant visited from PhotoDetail (id, name, rating)
    _photoDirs.forEach((dir) {
       File imgFile = PhotoManager.openImgFile(dir);
       File contentsFile = PhotoManager.openContentFile(dir);
       PhotoDetail contents = PhotoManager.getContents(contentsFile);

       // TODO: placeIds may change over time so try to find a way around it
       Restaurant res = Restaurant(
         id: contents.restaurantId,
         name: contents.restaurantName,
         rating: contents.rating,
         latitude: contents.latitude,
         longitude: contents.longitude
       );

       var rv = restaurantVisited(res, restaurantPhotos);
       if (rv == null) {
         restaurantPhotos[res] = [imgFile];
       }
       else {
         restaurantPhotos[rv].insert(0, imgFile);
       }
    });
    setState(() {});
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

    pos = await location.getLocation(); // get location
    print("${pos.latitude}, ${pos.longitude}");
    print("Accuracy: ${pos.accuracy}");
    setState(() {
      _currentPos = LatLng(pos.latitude, pos.longitude);
    });
  }

  @override
  void initState() {
    super.initState();
    _loadUserFoodprint(); // update gallery with photos
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
