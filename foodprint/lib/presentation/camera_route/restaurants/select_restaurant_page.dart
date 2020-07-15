import 'dart:io';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/application/restaurants/manual_search/manual_search_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/photo_details/save_details.dart';
import 'package:foodprint/presentation/camera_route/restaurants/restaurant_search_delegate.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

/// The page that displays a list of nearby [restaurants] for the user to
/// select.
///
/// If the list doesn't contain the desired restaurant, the user can use the
/// [ManualSearchPage] to find the correct one.
class SelectRestaurantPage extends StatefulWidget {
  final FoodprintEntity currentFoodprint;
  final File imageFile;
  final List<RestaurantEntity> restaurants;
  final JWT token;
  final double latitude;
  final double longitude;
  const SelectRestaurantPage(
      {Key key,
      @required this.imageFile,
      @required this.restaurants,
      @required this.currentFoodprint,
      @required this.latitude,
      @required this.longitude,
      @required this.token})
      : super(key: key);

  @override
  _SelectRestaurantPageState createState() => _SelectRestaurantPageState();
}

class _SelectRestaurantPageState extends State<SelectRestaurantPage> {
  final Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final bloc = context.bloc<ManualSearchBloc>();

    return BlocConsumer<ManualSearchBloc, ManualSearchState>(
        listener: (_, state) {
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
      final Widget body = _buildBody(state, bloc, context);

      return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            backgroundColor: backgroundColor,
            elevation: 0.0,
            centerTitle: true,
            actions: [
              IconButton(
                  icon: const Icon(
                    Icons.search,
                  ),
                  onPressed: () async {
                    final String place_id = await showSearch(
                        context: context,
                        delegate: RestaurantSearchDelegate(
                            widget.latitude, widget.longitude));
                    if (place_id != null) {
                      bloc.add(RestaurantDetailSearched(id: place_id));
                    }
                  })
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(20.0),
            child: body,
          ));
    });
  }

  Widget _buildBody(
      ManualSearchState state, ManualSearchBloc bloc, BuildContext context) {
    if (state is PlaceDetailSearchLoading) {
      // Loading indicator
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SpinKitRing(
              color: primaryColor,
              size: 100,
            ),
          ],
        ),
      );
    } else if (state is PlaceDetailSearchSuccess) {
      // Provide user with actions
      return Center(
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Icon(
                  Icons.check_circle_outline,
                  color: Colors.green,
                  size: 100,
                ),
                Text(
                  "Success!",
                  style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ],
            ),
            _buildActions(state, bloc),
          ],
        ),
      );
    } else {
      // Error or initial state
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.restaurants.isEmpty
                  ? "We couldn't find any restaurants near you"
                  : "Here's what we found near you",
              style: TextStyle(
                  fontSize: 35.0,
                  fontWeight: FontWeight.bold,
                  color: primaryColor),
            ),
            const SizedBox(
              height: 20,
            ),
            _buildRestaurantButtons(context),
          ],
        ),
      );
    }
  }

  Widget _buildActions(PlaceDetailSearchSuccess state, ManualSearchBloc bloc) {
    return Align(
      alignment: const Alignment(0.0, 0.7),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          FloatingActionButton.extended(
              backgroundColor: primaryColor,
              icon: const Icon(
                Icons.arrow_forward,
                color: Colors.white,
              ),
              heroTag: "proceed",
              onPressed: _toDetails(state.restaurant),
              label: Text(
                "Proceed",
                style: _buttonStyle,
              )),
          const SizedBox(
            height: 15,
          ),
          FlatButton(
            onPressed: () => bloc.add(ResetManualSearch()),
            child: Text(
              "Cancel",
              style: _buttonStyle.copyWith(color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  final TextStyle _buttonStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20);

  void Function() _toDetails(RestaurantEntity restaurant) {
    return () {
      Navigator.of(context).push(EnterExitRoute(
          exitPage: widget,
          enterPage: MultiBlocProvider(
            providers: [
              BlocProvider.value(value: context.bloc<PhotoActionsBloc>()),
              BlocProvider.value(value: context.bloc<FoodprintBloc>())
            ],
            child: PhotoDetailsPage(
              oldFoodprint: widget.currentFoodprint,
              token: widget.token,
              imageFile: widget.imageFile,
              restaurant: restaurant,
            ),
          )));
    };
  }

  /// Returns the widget containing the restaurant buttons given the [context].
  Widget _buildRestaurantButtons(BuildContext context) {
    // https://www.youtube.com/watch?v=RpQLFAFqMlw
    // TODO: Add community restaurant photo to list tile
    return ListView.separated(
        shrinkWrap: true,
        itemCount: widget.restaurants.length,
        separatorBuilder: (context, index) => const Divider(),
        itemBuilder: (cxt, index) => ListTile(
            title: Text(widget.restaurants[index].restaurantName.getOrCrash(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 18.0, fontWeight: FontWeight.w500)),
            subtitle: Text(
                widget.restaurants[index].restaurantRating
                    .getOrCrash()
                    .toString(),
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontSize: 14.0, fontWeight: FontWeight.w300)),
            leading: const Icon(
              Icons.restaurant,
              size: 30,
              color: Colors.black,
            ),
            onTap: _toDetails(widget.restaurants[index])));
  }
}
