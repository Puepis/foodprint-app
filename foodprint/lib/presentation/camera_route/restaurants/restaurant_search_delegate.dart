import 'package:flutter/material.dart';
import 'package:foodprint/application/restaurants/restaurant_search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

class RestaurantSearchDelegate extends SearchDelegate<String> {
  final double latitude;
  final double longitude;
  RestaurantSearchDelegate(this.latitude, this.longitude);

  @override
  List<Widget> buildActions(BuildContext context) {
    // actions for the app bar
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    // leading icon on the left of app bar
    return IconButton(
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        close(context, null);
      },
    );
  }

  /// Shows results based on the selection
  @override
  Widget buildResults(BuildContext context) {
    return Container(
      color: Colors.orange,
      height: 100,
      width: 100,
    );
  }

  /// Shows during search
  @override
  Widget buildSuggestions(BuildContext context) {
    // Fire event
    context.bloc<RestaurantSearchBloc>()
      ..add(AutocompleteRestaurantsSearched(
          latitude: latitude, longitude: longitude, input: query));

    return BlocBuilder<RestaurantSearchBloc, RestaurantSearchState>(
        builder: (context, state) {
      Widget searchBody;

      if (state is SearchStateLoading) {
        searchBody = const Padding(
            padding: EdgeInsets.all(20.0), child: CircularProgressIndicator());
      }
      if (state is SearchStateError) {
        print(state.failure.toString());
      }
      if (state is AutocompleteSearchSuccess) {
        final predictions = state.predictions;

        searchBody = ListView.builder(
            itemCount: predictions.length,
            itemBuilder: (context, index) {
              final name = predictions[index].name.getOrCrash();
              final location = predictions[index].secondaryText;
              return buildSearchResult(context, name, location);
            });
      }

      return Container(
        height: double.infinity,
        width: double.infinity,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
                alignment: Alignment.bottomRight,
                child: PoweredByGoogleImage()),
            searchBody ?? Container(),
          ],
        ),
      );
    });
  }

  Widget buildSearchResult(BuildContext context, String name, String location) {
    return ListTile(
      onTap: () {
        showResults(context);
      },
      leading: Icon(
        Icons.location_on,
        color: primaryColor,
        size: 30.0,
      ),
      subtitle: Text(
        location,
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
      ),
      title: RichText(
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
          text: TextSpan(
              text: name.substring(0, query.length),
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.black),
              children: [
                TextSpan(
                    text: name.substring(query.length),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.grey))
              ])),
    );
  }
}

class PoweredByGoogleImage extends StatelessWidget {
  final _poweredByGoogleOnWhite =
      "assets/powered_by_google/android/res/drawable-xxhdpi/powered_by_google_on_white.png";
  final _poweredByGoogleOnBlack =
      "assets/powered_by_google/android/res/drawable-xxhdpi/powered_by_google_on_non_white.png";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(16.0),
        child: Image.asset(
          Theme.of(context).brightness == Brightness.light
              ? _poweredByGoogleOnWhite
              : _poweredByGoogleOnBlack,
          scale: 2.5,
        ));
  }
}
