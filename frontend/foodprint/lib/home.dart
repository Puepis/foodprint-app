import 'dart:convert' show json, ascii, base64;
import 'dart:io';
import 'package:foodprint/camera/image_capture.dart';
import 'package:foodprint/auth/login_page.dart';
import 'package:foodprint/auth/tokens.dart';
import 'package:foodprint/gallery/gallery.dart';
import 'package:foodprint/models/gallery.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:provider/provider.dart';
import 'package:foodprint/map.dart';
import 'package:permission_handler/permission_handler.dart';


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

  final List<Permission> _permissions = [Permission.location, Permission.camera];
  int _selectedPage = 0;
  final _pages = [FoodMap(), ImageCapture(), Gallery()];
  List<FileSystemEntity> _photoDirs = [];

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

  Widget buildHomePage(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => GalleryModel(_photoDirs),
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
        body: _pages[_selectedPage],
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
      // TODO: FileSystemException Error
      _photoDirs = Directory('$path/photos/').listSync();
    });
  }

  @override
  void initState() {
    super.initState();
    // Update gallery with photos
    _getPhotos();
    _requestPermissions();
  }

  Future<void> _requestPermissions() async {
    for (Permission permission in _permissions) {
      await permission.request();
    }
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
