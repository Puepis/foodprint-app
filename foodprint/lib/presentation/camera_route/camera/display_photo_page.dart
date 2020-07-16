import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprint/application/restaurants/manual_search/manual_search_bloc.dart'
    hide SearchStateError;
import 'package:foodprint/application/restaurants/nearby_search/restaurant_search_bloc.dart';
import 'package:foodprint/presentation/camera_route/camera/camera.dart';
import 'package:foodprint/presentation/inherited_widgets/inherited_image.dart';
import 'package:foodprint/presentation/inherited_widgets/inherited_location.dart';

class DisplayPhoto extends StatefulWidget {
  const DisplayPhoto({
    Key key,
  }) : super(key: key);

  @override
  _DisplayPhotoState createState() => _DisplayPhotoState();
}

class _DisplayPhotoState extends State<DisplayPhoto> {
  @override
  Widget build(BuildContext context) {
    final loadedImage = InheritedImage.of(context).loadedImage;
    final latitude = InheritedLocation.of(context).latitude;
    final longitude = InheritedLocation.of(context).longitude;

    final nearbySearchBloc = context.bloc<RestaurantSearchBloc>();
    final manualSearchBloc = context.bloc<ManualSearchBloc>();

    return WillPopScope(
      onWillPop: () async => false,
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black,
            image: DecorationImage(fit: BoxFit.contain, image: loadedImage)),
        child: BlocConsumer<RestaurantSearchBloc, RestaurantSearchState>(
            listener: (context, state) {
          // Error searching for restaurants
          if (state is SearchStateError) {
            Scaffold.of(context)..hideCurrentSnackBar();
            FlushbarHelper.createError(
              message: state.failure.map(
                requestDenied: (_) => 'Request denied',
                unexpectedSearchFailure: (_) => 'Unexpected search failure',
                overQueryLimit: (_) => 'Over query limit',
                invalidRequest: (_) => 'Invalid request',
                notFound: (_) => 'Place not found',
              ),
            ).show(context);
          }
        }, builder: (_, state) {
          // Only search once
          if (state is SearchStateEmpty) {
            nearbySearchBloc.add(NearbyRestaurantsSearched(
                latitude: latitude, longitude: longitude));
          }
          return Stack(children: [
            Positioned(
                top: 30,
                left: 10,
                child: IconButton(
                  iconSize: 50.0,
                  icon: const Icon(
                    Icons.cancel,
                    color: Colors.red,
                  ),
                  onPressed: () async {
                    final bool pop = await _willCancel();
                    if (pop) {
                      Navigator.pop(context);

                      // Reset search states
                      nearbySearchBloc.add(ResetNearbySearch());
                      manualSearchBloc.add(ResetManualSearch());
                    }
                  },
                )),
            Positioned(
                bottom: 30,
                right: 20,
                child: (state is NearbySearchStateSuccess)
                    ? NextPageButton(
                        restaurants: state.restaurants,
                      )
                    : SpinKitRing(
                        color: Theme.of(context).primaryColor,
                        size: 40.0,
                      )),
          ]);
        }),
      ),
    );
  }

  Future<bool> _willCancel() async {
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
