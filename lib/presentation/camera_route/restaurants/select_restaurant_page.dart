import 'dart:io';
import 'package:flushbar/flushbar_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:foodprint/application/restaurants/manual_search/manual_search_bloc.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/camera_route/photo_details/save_details.dart';
import 'package:foodprint/presentation/camera_route/restaurants/restaurant_search_delegate.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/router/camera/save_details_args.dart';

/// The page that displays a list of nearby [restaurants] for the user to
/// select.
///
/// If the list doesn't contain the desired restaurant, the user can use the
/// [ManualSearchPage] to find the correct one.
class SelectRestaurantPage extends StatefulWidget {
  final File imageFile;
  final List<RestaurantEntity> restaurants;
  final double latitude;
  final double longitude;
  static const routeName = "restaurants/";
  const SelectRestaurantPage({
    Key key,
    @required this.imageFile,
    @required this.restaurants,
    @required this.latitude,
    @required this.longitude,
  }) : super(key: key);

  @override
  _SelectRestaurantPageState createState() => _SelectRestaurantPageState();
}

class _SelectRestaurantPageState extends State<SelectRestaurantPage> {
  final Color backgroundColor = Colors.white;

  @override
  Widget build(BuildContext context) {
    final bloc = context.bloc<ManualSearchBloc>();

    return BlocConsumer<ManualSearchBloc, ManualSearchState>(
        listener: (context, state) {
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
    }, builder: (_, state) {
      final Widget body = _buildBody(state, bloc);

      return Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.black,
                ),
                onPressed: () => Navigator.pop(context)),
            backgroundColor: backgroundColor,
            elevation: 0.0,
            centerTitle: true,
            actions: [
              IconButton(
                  icon: const Icon(
                    Icons.search,
                    color: Colors.black,
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

  /// Builds the scaffold body based on the [ManualBlocState]
  Widget _buildBody(ManualSearchState state, ManualSearchBloc bloc) {
    if (state is PlaceDetailSearchLoading) {
      // Loading indicator
      return Center(
        child: SpinKitRing(
          color: primaryColor,
          size: 100,
        ),
      );
    } else if (state is PlaceDetailSearchSuccess) {
      // Provide user with actions
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.check_circle_outline,
              color: Colors.green,
              size: 100,
            ),
            const SizedBox(
              height: 5,
            ),
            const Text(
              "Location Selected!",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 40,
            ),
            _buildActions(state, bloc),
          ],
        ),
      );
    } else {
      // Error or initial state
      return ListView(
        shrinkWrap: true,
        children: [
          Text(
            widget.restaurants.isEmpty
                ? "Try a manual search!"
                : "Select your location!",
            style: TextStyle(
                fontSize: 35.0,
                fontWeight: FontWeight.bold,
                color: primaryColorDark),
          ),
          const SizedBox(
            height: 2.5,
          ),
          const Text(
            "We couldn't find any places near you",
            style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.normal,
                color: Colors.grey),
          ),
          const SizedBox(
            height: 40,
          ),
          _buildRestaurantButtons(context),
        ],
      );
    }
  }

  /// Displayed after the user has selected a manually-searched restaurant
  Widget _buildActions(PlaceDetailSearchSuccess state, ManualSearchBloc bloc) {
    return Column(
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
    );
  }

  final TextStyle _buttonStyle = const TextStyle(
      color: Colors.white, fontWeight: FontWeight.normal, fontSize: 20);

  /// Returns a callback to proceed to the next page based on the [restaurant]
  VoidCallback _toDetails(RestaurantEntity restaurant) {
    return () => Navigator.of(context).pushNamed(SaveDetailsPage.routeName,
        arguments: SaveDetailsArgs(restaurant, widget.imageFile));
  }

  /// Returns the widget containing the restaurant buttons given the [context].
  Widget _buildRestaurantButtons(BuildContext context) {
    return ListView.separated(
        shrinkWrap: true,
        itemCount: widget.restaurants.length,
        separatorBuilder: (context, index) => const SizedBox(
              height: 10,
            ),
        itemBuilder: (cxt, index) => _buildButton(index));
  }

  Widget _buildButton(int index) {
    return Card(
      elevation: 5.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      color: primaryColor,
      child: ListTile(
          dense: true,
          contentPadding:
              const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
          title: Text(widget.restaurants[index].name.getOrCrash(),
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                  color: Colors.white,
                  fontSize: 18.0,
                  fontWeight: FontWeight.w600)),
          subtitle: Container(
            margin: const EdgeInsets.only(top: 5),
            child: Row(
              children: [
                Icon(
                  Icons.star,
                  color: foodprintPrimaryColorSwatch[700],
                  size: 20,
                ),
                const SizedBox(
                  width: 5.0,
                ),
                Text(widget.restaurants[index].rating.getOrCrash().toString(),
                    style: const TextStyle(
                        fontSize: 16.0, fontWeight: FontWeight.w500)),
              ],
            ),
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            color: Colors.black,
            size: 20,
          ),
          onTap: _toDetails(widget.restaurants[index])),
    );
  }
}
