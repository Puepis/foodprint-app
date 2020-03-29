import 'dart:convert' show json, ascii, base64;
import 'dart:io';
import 'package:foodprint/camera/image_capture_2.dart';
import 'package:foodprint/auth/login_page.dart';
import 'package:foodprint/auth/tokens.dart';
import 'package:foodprint/gallery/gallery.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:foodprint/map.dart';


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
  final _pages = [
    FoodMap(),
    Center(child: Text('Second Page')),
    Gallery(),
  ];
  List<FileSystemEntity> _photos = [];

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

  // Get the page based on selected index
  Widget getPage(int index, String id) {
    if (index == 1) {
      // Camera
      return ImageCapture(id: int.parse(id));
    } else {
      return _pages[_selectedPage];
    }
  }

  Widget buildHomePage(BuildContext context, String id) {
    return ChangeNotifierProvider(
      create: (context) => GalleryModel(_photos),
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text('Foodprint'),
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.subdirectory_arrow_right),
              onPressed: () async {
                // Log out
                bool successful = await attemptLogout(widget.payload['username']);
                if (successful) {
                  Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()
                      )
                  );
                }
              },
            )
          ],
        ),
        body: getPage(_selectedPage, id),
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _selectedPage,
          onTap: (int index) {
            setState(() {
              _selectedPage = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              title: Text('Home'),
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
        ),
      ),
    );
  }

  // Get all the stored photos
  void _getPhotos() async {
    String path = (await getApplicationDocumentsDirectory()).path;
    setState(() {
      _photos = Directory('$path/photos/').listSync();
    });
  }

  @override
  void initState() {
    super.initState();
    _getPhotos();
  }

  @override
  Widget build(BuildContext context) =>
    Container(
      child: FutureBuilder(
        future: http.read('$SERVER_IP/api/users/data', headers: {"Authorization": widget.jwt}),
          builder: (context, snapshot) =>
            snapshot.hasData ?  buildHomePage(context, snapshot.data):
              // Token expired
              snapshot.hasError ? LoginPage() : CircularProgressIndicator()
        ),
    );
}
