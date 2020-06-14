import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/service/authentication.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/widgets/camera/camera.dart';
import 'package:foodprint/widgets/gallery/gallery.dart';
import 'package:foodprint/widgets/map/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static const routeName = "/home";
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
                  icon: Icon(Icons.location_on),
                  onPressed: () {
                    setState(() {
                      _pageController.jumpToPage(0);
                    });
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  icon: Icon(Icons.collections),
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
        floatingActionButton: Consumer<UserModel>(
          builder: (context, userModel, child) {
            return Container(
              height: 75,
              width: 75,
              child: FittedBox(
                child: FloatingActionButton(
                  elevation: 20.0,
                  onPressed: () {
                    Navigator.of(context).push(_cameraRoute(userModel));
                  },
                  child: Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 35.0,
                  ),
                ),
              ),
            );
          },
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      )
    );
  }

  Route _cameraRoute(UserModel user) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Camera(user: user),
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
      leading: IconButton(
        icon: Icon(Icons.person),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: Icon(Icons.exit_to_app),
          onPressed: () async {
            // Log out
            bool successful = await AuthenticationService.attemptLogout(widget.payload['username']);
            if (successful) {
              Navigator.pushNamed(context, "/login");
            }
          },
        )
      ],
    );
  }


}
