
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

class Dashboard extends StatefulWidget {
  static const routeName = "/dashboard";
  final LatLng location;
  final Map<Restaurant, List<FoodprintPhoto>> userFoodprint;
  final String jwt;
  final Map<String, dynamic> payload;

  const Dashboard({Key key, @required this.location, @required this.userFoodprint,
    @required this.jwt, @required this.payload}) : super(key: key);
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserModel(widget.location, widget.jwt, widget.payload, widget.userFoodprint),
      child: WillPopScope(
        onWillPop: () async => false,
        child: Scaffold(
          appBar: appBar(context),
          body: _selectedIndex == 0 ? FoodMap(initialPos: widget.location) : Gallery(),
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
          floatingActionButton: Consumer<UserModel>(
            builder: (context, userModel, child) {
              return Container(
                height: 75,
                width: 75,
                child: FittedBox(
                  child: FloatingActionButton(
                    elevation: 20.0,
                    onPressed: () {
                      _takePicture(context, userModel);
                    },
                    child: const Icon(
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
        ),
      )
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

  PreferredSizeWidget appBar(BuildContext context) {
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
            final bool successful = await AuthenticationService.attemptLogout(widget.payload['username'].toString());
            if (successful) {
              Navigator.pushNamed(context, "/login"); // log out
            }
          },
        )
      ],
    );
  }

  // Display a snackbar if saved
  Future<void> _takePicture(BuildContext context, UserModel userModel) async {
    final bool saved = await Navigator.of(context).push(_cameraRoute(userModel));
    if (saved != null && saved) {
      Scaffold.of(context)..removeCurrentSnackBar()..showSnackBar(
        const SnackBar(
          content: Text("Image saved!"),
          behavior: SnackBarBehavior.floating,
        )
      );
    }
  }
}
