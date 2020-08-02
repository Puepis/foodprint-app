import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/location/location_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/presentation/camera_route/camera/camera.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/gallery/gallery_page.dart';
import 'package:foodprint/presentation/home/drawer/app_drawer.dart';
import 'package:foodprint/presentation/inherited_widgets/inherited_user.dart';
import 'package:foodprint/presentation/inherited_widgets/inherited_location.dart';
import 'package:foodprint/presentation/map/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final foodprint = InheritedUser.of(context).foodprint;
    final token = InheritedUser.of(context).token;

    return WillPopScope(
      onWillPop: () async => false,
      child: BlocBuilder<LocationBloc, LocationState>(
        builder: (context, state) {
          // Loading screen
          Widget mapScreen = const Center(child: CircularProgressIndicator());

          if (state is GetLocationSuccess) {
            mapScreen = FoodMap(
              foodprint: foodprint,
            );
          }

          return Scaffold(
            appBar: appBar(context),
            drawerEnableOpenDragGesture: false,
            drawer: AppDrawer(token: token, foodprint: foodprint),
            body: _selectedIndex == 0
                ? Stack(children: [mapScreen, mapMenuButton()])
                : Gallery(token: token,),
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
                  heroTag: "camera",
                  elevation: 20.0,
                  onPressed: () => (state is GetLocationSuccess)
                      ? _toCamera(context, state.latlng, token,
                          foodprint) // take picture
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

  // Open drawer button on the map page
  Positioned mapMenuButton() => Positioned(
      left: 10,
      top: 35,
      child: Builder(
        builder: (context) => FloatingActionButton(
          heroTag: "drawer",
          backgroundColor: Colors.white,
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          child: const Icon(
            Icons.menu,
            size: 32.0,
          ),
        ),
      ));

  // Animate transition to camera
  void _toCamera(
      BuildContext cxt, LatLng location, JWT token, FoodprintEntity foodprint) {
    Navigator.of(cxt).push(SlideUpEnterRoute(
        newPage: InheritedUser(
      foodprint: foodprint,
      token: token,
      child: InheritedLocation(
        latitude: location.latitude,
        longitude: location.longitude,
        child: MultiBlocProvider(providers: [
          BlocProvider.value(value: cxt.bloc<PhotoActionsBloc>()),
          BlocProvider.value(value: cxt.bloc<FoodprintBloc>())
        ], child: const FoodprintCapture()),
      ),
    )));
  }

  PreferredSizeWidget appBar(BuildContext context) {
    // Don't display app bar on map page
    if (_selectedIndex == 0) {
      return null;
    }

    // Display appbar on gallery page
    return AppBar(
      centerTitle: true,
      automaticallyImplyLeading: false,
      title: const Text(
        'Gallery',
      ),
      leading: Builder(
          builder: (context) => IconButton(
                icon: const Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              )),
      actions: [
        IconButton(
          icon: const Icon(Icons.tune),
          onPressed: () {},
        )
      ],
    );
  }
}
