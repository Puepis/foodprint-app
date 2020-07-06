import 'dart:io';

import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprint/application/restaurants/restaurant_search_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/injection.dart';
import 'package:foodprint/presentation/camera_route/camera/camera.dart';

class DisplayPhoto extends StatefulWidget {
  const DisplayPhoto({
    Key key,
    @required this.latitude,
    @required this.longitude,
    @required this.loadedImage,
    @required this.imageFile,
    @required this.oldFoodprint,
    @required this.token,
  }) : super(key: key);

  final double latitude;
  final double longitude;
  final File imageFile;
  final FileImage loadedImage;
  final FoodprintEntity oldFoodprint;
  final JWT token;

  @override
  _DisplayPhotoState createState() => _DisplayPhotoState();
}

class _DisplayPhotoState extends State<DisplayPhoto> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<RestaurantSearchBloc>(
      // Begin searching for restaurants
      create: (context) => getIt<RestaurantSearchBloc>()
        ..add(RestaurantSearched(
            latitude: widget.latitude, longitude: widget.longitude)),
      child: WillPopScope(
        onWillPop: _onWillPop,
        child: Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.fitHeight, image: widget.loadedImage)),
          child: BlocConsumer<RestaurantSearchBloc, RestaurantSearchState>(
              listener: (context, state) {
            // Error searching for restaurants
            if (state is SearchStateError) {
              Scaffold.of(context)..hideCurrentSnackBar();
              FlushbarHelper.createError(
                message: state.failure.map(
                  requestDenied: (_) => 'Request denied',
                  unexpectedSearchFailure: (_) => 'Unexpected search failure',
                ),
              ).show(context);
            }
          }, builder: (_, state) {
            return Stack(children: [
              Positioned(
                  top: 30,
                  left: 10,
                  child: IconButton(
                    icon: const Icon(
                      Icons.cancel,
                      color: Colors.red,
                      size: 50.0,
                    ),
                    onPressed: () => Navigator.pop(context),
                  )),
              const Positioned(
                left: 10,
                bottom: 20,
                child: IconButton(
                  icon: Icon(
                    Icons.refresh,
                    color: Colors.white,
                    size: 40.0,
                  ),
                  onPressed: null,
                ),
              ),
              Positioned(
                  bottom: 20,
                  right: 30,
                  child: (state is SearchStateSuccess)
                      ? NextPageButton(
                          restaurants: state.restaurants,
                          token: widget.token,
                          imageFile: widget.imageFile,
                          oldFoodprint: widget.oldFoodprint,
                        )
                      : SpinKitRing(
                          color: Theme.of(context).primaryColor,
                          size: 40.0,
                        )),
            ]);
          }),
        ),
      ),
    );
  }

  Future<bool> _onWillPop() async {
    return (await showDialog(
            context: context,
            builder: (context) => Dialog(
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20.0)),
                  child: Container(
                    height: 205,
                    padding: const EdgeInsets.all(20.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 5.0),
                          child: Text(
                            "Are you sure you want to \n discard your photo?",
                            textAlign: TextAlign.center,
                            style:
                                TextStyle(color: Colors.black, fontSize: 14.0),
                          ),
                        ),
                        const SizedBox(
                          height: 20.0,
                        ),
                        ButtonTheme(
                          minWidth: 200,
                          height: 50,
                          child: FlatButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30.0)),
                            color: Colors.black87,
                            onPressed: () => Navigator.of(context).pop(true),
                            child: const Text(
                              "Confirm",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 5.0,
                        ),
                        FlatButton(
                          onPressed: () => Navigator.of(context).pop(false),
                          child: const Text(
                            "Cancel",
                            style:
                                TextStyle(fontSize: 16.0, color: Colors.black),
                          ),
                        )
                      ],
                    ),
                  ),
                ))) ??
        false;
  }
}
