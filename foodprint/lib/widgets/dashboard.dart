import 'package:foodprint/models/user_model.dart';
import 'package:foodprint/service/authentication.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/widgets/camera/camera.dart';
import 'package:foodprint/widgets/gallery/gallery.dart';
import 'package:foodprint/widgets/map/map.dart';
import 'package:provider/provider.dart';

class Dashboard extends StatefulWidget {
  static const routeName = "/dashboard";
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final UserModel user = context.watch<UserModel>();
    return WillPopScope(
      onWillPop: () async => false,
      child: Scaffold(
        appBar: appBar(context, user),
        body: _selectedIndex == 0 ? FoodMap(initialPos: user.location) : Gallery(),
        bottomNavigationBar: BottomAppBar(
          shape: const CircularNotchedRectangle(),
          child: Container(
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  iconSize: 30.0,
                  icon: const Icon(Icons.location_on),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 0;
                    });
                  },
                ),
                IconButton(
                  iconSize: 30.0,
                  icon: const Icon(Icons.collections),
                  onPressed: () {
                    setState(() {
                      _selectedIndex = 1;
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
              onPressed: () async {
                await Navigator.of(context).push(_cameraRoute(user)); // take picture
              },
              child: const Icon(
                Icons.add,
                color: Colors.white,
                size: 35.0,
              ),
            ),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  // Animate transition to camera
  Route<bool> _cameraRoute(UserModel user) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => Camera(user: user),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        final end = Offset.zero;
        final curve = Curves.ease;
        final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
    );
  }

  PreferredSizeWidget appBar(BuildContext context, UserModel user) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text('Foodprint'),
      leading: IconButton(
        icon: const Icon(Icons.person),
        onPressed: () {},
      ),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () async {
            final bool successful = await AuthenticationService.attemptLogout(user.payload['username'].toString());
            if (successful) {
              Navigator.pushNamed(context, "/login"); // log out
            }
          },
        )
      ],
    );
  }
}
