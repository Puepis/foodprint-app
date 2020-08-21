import 'package:dartz/dartz.dart' show Tuple2;
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/location/location_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/camera/camera.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/core/styles/gradients.dart';
import 'package:foodprint/presentation/gallery/gallery.dart';
import 'package:foodprint/presentation/home/drawer/app_drawer.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:foodprint/presentation/data/user_location.dart';
import 'package:foodprint/presentation/map/map.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';
import 'package:provider/provider.dart';

enum SortBy { latest, oldest, favourites, highestPrice, lowestPrice }
enum SelectedPage { map, gallery }

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  SelectedPage _page = SelectedPage.map;
  SortBy _selectedSort = SortBy.latest;
  AnimationController _hide;
  bool _showFAB = true;
  final PageController _pageController = PageController();

  /// Each entry in the list contains a photo paired with its corresponding location
  List<Tuple2<PhotoEntity, RestaurantEntity>> assocPhotos;

  @override
  void initState() {
    super.initState();
    _hide = AnimationController(vsync: this, duration: kThemeAnimationDuration)
      ..forward();
  }

  @override
  void dispose() {
    super.dispose();
    _hide.dispose();
    _pageController.dispose();
  }

  bool _handleScrollNotification(ScrollNotification notification) {
    if (notification.depth == 0) {
      if (notification is UserScrollNotification) {
        final UserScrollNotification userScroll = notification;
        switch (userScroll.direction) {
          case ScrollDirection.forward:
            setState(() {
              _showFAB = true;
            });
            _hide.forward();
            break;
          case ScrollDirection.reverse:
            setState(() {
              _showFAB = false;
            });
            _hide.reverse();
            break;
          case ScrollDirection.idle:
            break;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserData>();

    return BlocConsumer<LocationBloc, LocationState>(
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

        return NotificationListener<ScrollNotification>(
          onNotification: _page == SelectedPage.map
              ? (_) => null
              : _handleScrollNotification,
          child: Scaffold(
            drawerEnableOpenDragGesture: _page != SelectedPage.map,
            appBar: _buildAppBar(context),
            drawer: const AppDrawer(),
            body: PageView(
              controller: _pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: [
                Stack(children: [mapScreen, _buildMapDrawerButton()]),
                Gallery(
                  sortBy: _selectedSort,
                )
              ],
            ),
            bottomNavigationBar: ClipRect(
              child: SizeTransition(
                sizeFactor: _hide,
                axisAlignment: -1,
                child: BottomAppBar(
                  shape: const CircularNotchedRectangle(),
                  child: Container(
                    height: 60,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        IconButton(
                          iconSize: 30.0,
                          icon: const Icon(Icons.location_on),
                          color: _page == SelectedPage.map
                              ? const Color(0xFFFF916F)
                              : Colors.black,
                          onPressed: () {
                            _pageController.jumpToPage(0);
                            setState(() => _page = SelectedPage.map);
                          },
                        ),
                        IconButton(
                          iconSize: 30.0,
                          color: _page == SelectedPage.gallery
                              ? const Color(0xFFFF916F)
                              : Colors.black,
                          icon: const Icon(Icons.collections),
                          onPressed: () {
                            _pageController.jumpToPage(1);
                            setState(() => _page = SelectedPage.gallery);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            floatingActionButton: Visibility(
              visible: _showFAB,
              child: FloatingActionButton(
                heroTag: "camera",
                onPressed: () => (state is GetLocationSuccess)
                    ? _toCamera(context, state.latlng, userData) // take picture
                    : FlushbarHelper.createError(
                            message: 'Location permission required')
                        .show(context),
                child: Container(
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      gradient: LinearGradient(
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft,
                          colors: sweetMorningGradient.reversed.toList())),
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
          ),
        );
      },
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
        ], child: CameraNavigator()),
      ),
    );
  }

  /// The app bar is only shown in the gallery page
  PreferredSizeWidget _buildAppBar(BuildContext context) {
    return _page == SelectedPage.map
        ? null
        : GradientAppBar(
            gradient: LinearGradient(
              colors: sweetMorningGradient,
            ),
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
            actions: [_buildSortMenu()],
          );
  }

  /// The popup menu for sorting gallery photos.
  PopupMenuButton<SortBy> _buildSortMenu() {
    return PopupMenuButton<SortBy>(
      offset: const Offset(0, 10),
      tooltip: "Sort photos",
      onSelected: (result) => setState(() => _selectedSort = result),
      itemBuilder: (BuildContext context) => [
        _buildSortItem(SortBy.latest, "Date Taken", Icons.arrow_downward),
        _buildSortItem(SortBy.oldest, "Date Taken", Icons.arrow_upward),
        _buildSortItem(SortBy.highestPrice, "Price", Icons.arrow_downward),
        _buildSortItem(SortBy.lowestPrice, "Price", Icons.arrow_upward),
        PopupMenuItem<SortBy>(
          value: SortBy.favourites,
          child: Text(
            'Favourites',
            style: TextStyle(
              color: Colors.black,
              fontWeight: _selectedSort == SortBy.favourites
                  ? FontWeight.w600
                  : FontWeight.normal,
            ),
          ),
        ),
      ],
    );
  }

  PopupMenuItem<SortBy> _buildSortItem(
      SortBy value, String text, IconData iconData) {
    return PopupMenuItem<SortBy>(
      value: value,
      child: Row(
        children: [
          Text(text,
              style: TextStyle(
                color: Colors.black,
                fontWeight: _selectedSort == value
                    ? FontWeight.w600
                    : FontWeight.normal,
              )),
          const SizedBox(
            width: 4.0,
          ),
          Icon(iconData,
              size: 18,
              color: _selectedSort == value ? Colors.black : Colors.grey),
        ],
      ),
    );
  }
}
