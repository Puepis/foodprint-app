import 'package:dartz/dartz.dart' show Tuple2;
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/location/location_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/core/value_transformers.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/camera/camera.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/gallery/gallery_page.dart';
import 'package:foodprint/presentation/home/drawer/app_drawer.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:foodprint/presentation/data/user_location.dart';
import 'package:foodprint/presentation/map/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:provider/provider.dart';

enum SortBy { latest, oldest, favourites, highestPrice, lowestPrice }
enum SelectedPage { home, gallery }

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  SelectedPage _page = SelectedPage.home;
  SortBy _selectedSort = SortBy.latest;

  /// Each entry in the list contains a photo paired with its corresponding location
  List<Tuple2<PhotoEntity, RestaurantEntity>> assocPhotos;

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserData>();
    final foodprint = userData.foodprint;
    _sortFoodprint(foodprint);

    return WillPopScope(
      onWillPop: () async => false,
      child: BlocConsumer<LocationBloc, LocationState>(
        listener: (context, state) {
          if (state is GetLocationFailure) {
            Scaffold.of(context)..hideCurrentSnackBar();
            FlushbarHelper.createError(
                message: state.failure.map(
                    permissionDenied: (_) => 'Location permission denied',
                    locationServiceDisabled: (_) => 'Location service disabled',
                    unexpected: (_) => 'Unexpected error')).show(context);
          }
        },
        builder: (context, state) {
          final mapScreen =
              state is GetLocationSuccess ? const FoodMap() : Container();

          return Scaffold(
            appBar: _buildAppBar(context),
            drawerEnableOpenDragGesture: false,
            drawer: const AppDrawer(),
            body: _page == SelectedPage.home
                ? Stack(children: [mapScreen, _buildMapDrawerButton()])
                : Gallery(
                    photos: assocPhotos,
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
                        setState(() => _page = SelectedPage.home);
                      },
                    ),
                    IconButton(
                      iconSize: 30.0,
                      icon: const Icon(Icons.collections),
                      onPressed: () {
                        setState(() => _page = SelectedPage.gallery);
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
                      ? _toCamera(
                          context, state.latlng, userData) // take picture
                      : FlushbarHelper.createError(
                              message: 'Location permission required')
                          .show(context),
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
  Positioned _buildMapDrawerButton() => Positioned(
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

  /// Animate transition to camera
  void _toCamera(BuildContext cxt, LatLng location, UserData data) {
    Navigator.of(cxt).push(
      SlideUpEnterRoute(
        newPage: MultiProvider(providers: [
          ChangeNotifierProvider(
              create: (context) =>
                  UserLocation(location.latitude, location.longitude)),
          ChangeNotifierProvider.value(value: data),
          BlocProvider.value(value: cxt.bloc<PhotoActionsBloc>()),
          BlocProvider.value(value: cxt.bloc<FoodprintBloc>())
        ], child: const CameraPage()),
      ),
    );
  }

  /// The app bar is only shown in the gallery page
  PreferredSizeWidget _buildAppBar(BuildContext context) => _page ==
          SelectedPage.home
      ? null
      : AppBar(
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
            PopupMenuButton<SortBy>(
              initialValue: _selectedSort,
              tooltip: "Sort photos",
              onSelected: (result) => setState(() => _selectedSort = result),
              itemBuilder: (BuildContext context) => <PopupMenuEntry<SortBy>>[
                const PopupMenuItem<SortBy>(
                  value: SortBy.latest,
                  child: Text('Latest'),
                ),
                const PopupMenuItem<SortBy>(
                  value: SortBy.oldest,
                  child: Text('Oldest'),
                ),
                const PopupMenuItem<SortBy>(
                  value: SortBy.highestPrice,
                  child: Text('Price (high to low)'),
                ),
                const PopupMenuItem<SortBy>(
                  value: SortBy.lowestPrice,
                  child: Text('Price (low to high)'),
                ),
                const PopupMenuItem<SortBy>(
                  value: SortBy.favourites,
                  child: Text('Favourites'),
                ),
              ],
            )
          ],
        );

  /// Generates an association list of photos and sorts by the selected option
  /// in the gallery.
  void _sortFoodprint(FoodprintEntity foodprint) {
    assocPhotos = getPhotoAssocFromFoodprint(foodprint);
    switch (_selectedSort) {
      case SortBy.latest:
        assocPhotos.sort((a, b) => b.value1.timestamp
            .getOrCrash()
            .compareTo(a.value1.timestamp.getOrCrash()));
        break;
      case SortBy.oldest:
        assocPhotos.sort((a, b) => a.value1.timestamp
            .getOrCrash()
            .compareTo(b.value1.timestamp.getOrCrash()));
        break;
      case SortBy.favourites:
        assocPhotos.retainWhere((element) => element.value1.isFavourite);
        break;
      case SortBy.highestPrice:
        assocPhotos.sort((a, b) => b.value1.details.price
            .getOrCrash()
            .compareTo(a.value1.details.price.getOrCrash()));
        break;
      case SortBy.lowestPrice:
        assocPhotos.sort((a, b) => a.value1.details.price
            .getOrCrash()
            .compareTo(b.value1.details.price.getOrCrash()));
        break;
    }
  }
}
