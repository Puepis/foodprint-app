import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/location/location_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/presentation/camera_route/camera/camera.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/gallery/gallery_page.dart';
import 'package:foodprint/presentation/map/map.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  final FoodprintEntity foodprint;
  final JWT token;

  const HomePage({Key key, @required this.token, @required this.foodprint})
      : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String username;
  int _selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async => false,
      child: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          Widget mapScreen = Center(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SpinKitDualRing(
                color: Theme.of(context).primaryColor,
              ),
              const SizedBox(height: 20.0),
              Text(
                "Retrieving location",
                style: TextStyle(
                    color: Theme.of(context).primaryColor,
                    fontSize: 30.0,
                    fontWeight: FontWeight.bold),
              )
            ],
          ));

          if (state is GetLocationSuccess) {
            mapScreen = FoodMap(
              initialPos: state.latlng,
              foodprint: widget.foodprint,
            );
          }

          return Scaffold(
            appBar: appBar(context),
            drawerEnableOpenDragGesture: false,
            drawer: Drawer(
              child: ListView(),
            ),
            body: _selectedIndex == 0
                ? mapScreen
                : Gallery(
                    foodprint: widget.foodprint,
                  ),
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
                  onPressed: () => (state is GetLocationSuccess)
                      ? _useCamera(context, state.latlng) // take picture
                      : null,
                  child: const Icon(
                    Icons.add,
                    color: Colors.white,
                    size: 35.0,
                  ),
                ),
              ),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
          );
        },
      ),
    );
  }

  // Animate transition to camera
  void _useCamera(BuildContext cxt, LatLng location) {
    Navigator.of(cxt).push(SlideUpEnterRoute(
        newPage: MultiBlocProvider(
            providers: [
          BlocProvider.value(value: cxt.bloc<PhotoActionsBloc>()),
          BlocProvider.value(value: cxt.bloc<FoodprintBloc>())
        ],
            child: Camera(
              location: location,
              token: widget.token,
              oldFoodprint: widget.foodprint,
            ))));
  }

  PreferredSizeWidget appBar(BuildContext context) {
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: Text(
        'Foodprint',
        style: Theme.of(context).textTheme.headline6,
      ),
      leading: Builder(
          builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              )),
      actions: <Widget>[
        IconButton(
          icon: const Icon(Icons.exit_to_app),
          onPressed: () {
            context.bloc<AuthBloc>().add(AuthEvent.loggedOut(widget.token));
          },
        )
      ],
    );
  }
}
