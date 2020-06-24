import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/location/location_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/camera/camera_screen.dart';
import 'package:foodprint/presentation/gallery/gallery.dart';
import 'package:foodprint/presentation/map/map.dart';
import 'package:foodprint/presentation/routes/router.gr.dart';
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
    return BlocProvider(
      create: (context) => getIt<PhotoActionsBloc>(),
      child: WillPopScope(
        onWillPop: () async => false,
        child: BlocBuilder<LocationBloc, LocationState>(
          builder: (context, state) {
            Widget mapScreen = FoodMap(initialPos: null, foodprint: widget.foodprint,); // TODO: don't show map

            if (state is GetLocationSuccess) {
              mapScreen = FoodMap(initialPos: state.latlng, foodprint: widget.foodprint,);
            }

            return Scaffold(
              appBar: appBar(context),
              body: _selectedIndex == 0 ? mapScreen : Gallery(foodprint: widget.foodprint,),
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
                        ? Navigator.of(context)
                            .push(_cameraRoute(state.latlng)) // take picture
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
      ),
    );
  }

  // Animate transition to camera
  Route<bool> _cameraRoute(LatLng location) {
    final UserID id =
        UserID(JWT.getDecodedPayload(widget.token.getOrCrash())['sub'] as int);

    return PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) =>
            MultiBlocProvider(
                providers: [
                  BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
                  BlocProvider.value(value: context.bloc<FoodprintBloc>())
                ],
                child: Camera(
                  location: location,
                  userID: id,
                  oldFoodprint: widget.foodprint,
                )),
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          const begin = Offset(0.0, 1.0);
          final end = Offset.zero;
          final curve = Curves.ease;
          final tween =
              Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
          return SlideTransition(
            position: animation.drive(tween),
            child: child,
          );
        });
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
          onPressed: () {
            context.bloc<AuthBloc>().add(AuthEvent.loggedOut(widget.token));
            ExtendedNavigator.of(context)
                .pushReplacementNamed(Routes.loginPage);
          },
        )
      ],
    );
  }
}
