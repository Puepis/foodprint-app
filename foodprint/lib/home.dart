import 'dart:convert' show ascii, base64, json, jsonDecode;
import 'package:foodprint/camera/camera.dart';
import 'package:foodprint/auth/login_page.dart';
import 'package:foodprint/auth/tokens.dart';
import 'package:foodprint/gallery/gallery.dart';
import 'package:foodprint/map/map.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/gallery_model.dart';
import 'package:foodprint/models/photo_response.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:location/location.dart';
import 'package:http/http.dart' as http;

class HomePage extends StatefulWidget {
  // Constructor
  HomePage(this.jwt, this.payload);

  // Web Token and Payload
  final String jwt;
  final Map<String, dynamic> payload;

  // Factory constructor - decode the payload
  factory HomePage.construct(String jwt) {
    String payload = jwt.split(".")[1];
    return HomePage(jwt, json.decode(ascii.decode(base64.decode(base64.normalize(payload)))));
  }

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  // TODO: Organize constants
  static const int AUTHORIZED = 1;
  static const int UNAUTHORIZED = 0;
  static const int PENDING = 2;
  final LatLng toronto = LatLng(43.651070, -79.347015);
  int _selectedPage = 0;
  LatLng _currentPos;
  PhotoResponse _photoResponse;
  Map<Restaurant, List<FoodprintPhoto>> _userFoodprint = Map();
  int _authStatus = PENDING;

  // TODO: organize auth methods into one file
  Future<bool> attemptLogout(String username) async {
    var res = await http.post(
        "$SERVER_IP/api/users/logout",
        body: {
          "username": username
        }
    );
    return res.statusCode == 200;
  }

  Map<Restaurant, List<FoodprintPhoto>> _sortByRestaurant(PhotoResponse response) {
    // TODO: sort photos chronologically
    Map<Restaurant, List<FoodprintPhoto>> result = Map();
    response.photos.forEach((photo) {
      var rv = _restaurantKey(photo.restaurantId, result);
      if (rv == null) { // generate new key
        // TODO: placeIds may change over time so try to find a way around it
        Restaurant place = Restaurant(
            id: photo.restaurantId,
            name: photo.restaurantName,
            rating: photo.restaurantRating,
            latitude: photo.latitude,
            longitude: photo.longitude
        );
        result[place] = [photo];
      }
      else {
        result[rv].insert(0, photo);
      }
    });
    return result;
  }

  dynamic _restaurantKey(String id, Map photos) {
    for (Restaurant restaurant in photos.keys) {
      if (id.compareTo(restaurant.id) == 0) { // compare restaurant ids
        return restaurant;
      }
    }
    return null;
  }

  void _setUserFoodprintAndLocation() async {
    LatLng location = await getLocation();
    var res = await http.get(
      '$SERVER_IP/api/users/photos',
      headers: {"authorization": "Bearer ${widget.jwt}"}
    );

    if (res.statusCode == 200) {
      print("Photos retrieved");
      print(jsonDecode(res.body)['photos']);
      PhotoResponse response = PhotoResponse.fromJson(jsonDecode(res.body));
      setState(() {
        _authStatus = AUTHORIZED;
        _currentPos = location;
        _photoResponse = response;
        _userFoodprint = _sortByRestaurant(response);
      });
    } else if (res.statusCode == 403) { // unauthorized
      print(res.body); // TODO? display dialog
      setState(() {
        _authStatus = UNAUTHORIZED;
      });
    } else if (res.statusCode == 400) { // error getting photos
     print(res.body);
     setState(() {
       _authStatus = AUTHORIZED;
       _currentPos = location;
     });
    } else {
      print(res.statusCode);
      print(res.body);
      setState(() {
        _authStatus = UNAUTHORIZED; // TODO: Handle unexpected error
      });
    }
  }

  // Set LatLng coordinates
  Future<LatLng> getLocation() async {

    final Location location = Location();
    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData pos;

    // Check service
    _serviceEnabled = await location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await location.requestService();
      if (!_serviceEnabled) {
        return toronto; // default location
      }
    }

    // Check permissions
    _permissionGranted = await location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return toronto;
      }
    }
    pos = await location.getLocation(); // get location
    return LatLng(pos.latitude, pos.longitude);
  }

  @override
  void initState() {
    super.initState();
    _setUserFoodprintAndLocation(); // initialize user foodprint + location
  }

  @override
  Widget build(BuildContext context) {
    Widget result;
    switch(_authStatus) {
      case AUTHORIZED: {result = buildHomePage(context);}
      break;
      case PENDING: {
        result =  Container(
          child: CircularProgressIndicator()
        );
      }
      break;
      case UNAUTHORIZED: {result = LoginPage();}
      break;
    }
    return result;
  }

  Widget buildHomePage(BuildContext context) {
    List<FoodprintPhoto> initPhotos = _photoResponse == null ? [] : _photoResponse.photos;
    return ChangeNotifierProvider(
      create: (context) => GalleryModel(initPhotos),
      child: Scaffold(
          appBar: appBar(context),
          body: _getPage(_selectedPage),
          bottomNavigationBar: navBar()
      ),
    );
  }

  // Render widget
  Widget _getPage(int selected) {
    switch(selected) {
      case 0: { return FoodMap(initialPos: _currentPos, userFoodprint: _userFoodprint); }
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
                        id: widget.payload['sub'], // TODO: use better state management
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
}
