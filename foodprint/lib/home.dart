import 'package:foodprint/camera/camera.dart';
import 'package:foodprint/auth/login_page.dart';
import 'package:foodprint/gallery/gallery.dart';
import 'package:foodprint/map/map.dart';
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/service/auth.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  final LatLng location;
  final List<FoodprintPhoto> photos;
  final Map<Restaurant, List<FoodprintPhoto>> userFoodprint;
  final String jwt;
  final Map<String, dynamic> payload;

  const HomePage({Key key, @required this.location, @required this.photos,
    @required this.userFoodprint, @required this.jwt, @required this.payload}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController _pageController = PageController(initialPage: 0);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(widget.jwt, widget.payload, widget.photos, widget.userFoodprint),
      child: Scaffold(
        appBar: appBar(context),
        body: PageView(
          controller: _pageController,
          children: [
            FoodMap(initialPos: widget.location),
            Gallery()
          ],
          physics: NeverScrollableScrollPhysics(), // disable swipe
        ),
        bottomNavigationBar: BottomAppBar(
          shape: CircularNotchedRectangle(),
          child: Container(
            height: 60,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.map),
                  onPressed: () {
                    setState(() {
                      _pageController.jumpToPage(0);
                    });
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.landscape),
                  onPressed: () {
                    setState(() {
                      _pageController.jumpToPage(1);
                    });
                  },
                )
              ],
            ),
          ),
        ),
        floatingActionButton: Container(
          height: 75,
          width: 75,
          child: FittedBox(
            child: FloatingActionButton(
              elevation: 20.0,
              onPressed: () {
                Navigator.of(context).push(_cameraRoute());
              },
              child: Icon(
                Icons.add,
                color: Colors.white,
                size: 35.0,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      )
    );
  }

  Route _cameraRoute() {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Camera(),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.ease;
        var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
    );
  }

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
            bool successful = await AuthService.attemptLogout(widget.payload['username']);
            if (successful) {
              Navigator.push(context, MaterialPageRoute(builder: (context) => LoginPage()));
            }
          },
        )
      ],
    );
  }


}
