import 'dart:io';

import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/restaurants/manual_search/manual_search_bloc.dart'
    hide SearchStateError;
import 'package:foodprint/application/restaurants/nearby_search/restaurant_search_bloc.dart';
import 'package:foodprint/presentation/camera_route/camera/camera.dart';
import 'package:foodprint/presentation/data/user_location.dart';
import 'package:foodprint/presentation/walkthrough/overlays/capture_overlay.dart';
import 'package:provider/provider.dart';

/// The page that displays the captured photo and searches for nearby restaurants
/// in the background.
class DisplayPhoto extends StatefulWidget {
  final File imageFile;
  final FileImage loadedImage;
  final VoidCallback onSaveOrAbort;
  const DisplayPhoto({
    Key key,
    @required this.imageFile,
    @required this.onSaveOrAbort,
    @required this.loadedImage,
  })  : assert(onSaveOrAbort != null),
        super(key: key);

  @override
  _DisplayPhotoState createState() => _DisplayPhotoState();
}

class _DisplayPhotoState extends State<DisplayPhoto> {
  @override
  Widget build(BuildContext context) {
    final location = context.watch<UserLocation>();

    final nearbySearchBloc = context.bloc<RestaurantSearchBloc>();
    final manualSearchBloc = context.bloc<ManualSearchBloc>();

    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(fit: BoxFit.cover, image: widget.loadedImage)),
      child: BlocConsumer<RestaurantSearchBloc, RestaurantSearchState>(
          listener: (context, state) {
        // Error searching for restaurants
        if (state is SearchStateError) {
          FlushbarHelper.createError(
            message: state.failure.map(
              requestDenied: (_) => 'Request denied',
              unexpectedSearchFailure: (_) => 'Unexpected search failure',
              overQueryLimit: (_) => 'Over query limit',
              invalidRequest: (_) => 'Invalid request',
              noInternet: (_) => 'No Internet Connection',
              notFound: (_) => 'Place not found',
            ),
          ).show(context);
        }
      }, buildWhen: (previous, current) {
        return previous is! SearchStateError;
      }, builder: (_, state) {
        // Only search once
        if (state is SearchStateEmpty) {
          nearbySearchBloc.add(NearbyRestaurantsSearched(
              latitude: location.latitude, longitude: location.longitude));
        }
        return Stack(children: [
          Positioned(
              top: 30,
              left: 5,
              child: IconButton(
                iconSize: 50.0,
                icon: Icon(
                  Icons.cancel,
                  color: Colors.red.shade600,
                ),
                onPressed: () async {
                  final bool pop = await _willCancel();
                  if (pop) {
                    // Reset search states
                    nearbySearchBloc.add(ResetNearbySearch());
                    manualSearchBloc.add(ResetManualSearch());
                    widget.onSaveOrAbort(); // abort
                  }
                },
              )),
          const CaptureOverlay(),
          Positioned(
              bottom: 20,
              right: 20,
              child: (state is NearbySearchStateSuccess)
                  ? NextPageButton(
                      restaurants: state.restaurants,
                      imageFile: widget.imageFile,
                    )
                  : (state is SearchStateError)
                      ? const Icon(Icons.error, color: Colors.red, size: 50)
                      : Container(
                          padding: const EdgeInsets.all(12),
                          height: 60,
                          width: 60,
                          child: const Center(
                              child: CircularProgressIndicator()))),
        ]);
      }),
    );
  }

  /// Display a confirmation dialog when user cancels the action.
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
