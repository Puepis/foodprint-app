import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/restaurants/manual_search/manual_search_bloc.dart';
import 'package:foodprint/domain/manual_search/autocomplete_result_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

/// The delegate where users can search for a location
class RestaurantSearchDelegate extends SearchDelegate<String> {
  final double latitude;
  final double longitude;
  RestaurantSearchDelegate(this.latitude, this.longitude);

  /// Restrict search to these types
  static const _acceptedTypes = ["restaurant", "food", "cafe", "bar", "bakery"];

  // Custom appBarTheme
  @override
  ThemeData appBarTheme(BuildContext context) {
    assert(context != null);
    final ThemeData theme = Theme.of(context);
    assert(theme != null);
    return theme.copyWith(
      primaryColor: Colors.white,
      primaryIconTheme: theme.primaryIconTheme.copyWith(color: Colors.grey),
      primaryColorBrightness: Brightness.light,
      primaryTextTheme: theme.textTheme,
      inputDecorationTheme: theme.inputDecorationTheme.copyWith(
          hintStyle:
              const TextStyle(fontWeight: FontWeight.normal, fontSize: 18.0)),
    );
  }

  @override
  String get searchFieldLabel => 'Search restaurants';

  @override
  List<Widget> buildActions(BuildContext context) {
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

  /// Not used
  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  /// Sort by accepted results
  bool _isAccepted(AutocompleteResultEntity place) {
    for (final keyword in _acceptedTypes) {
      if (place.types.contains(keyword)) {
        return true;
      }
    }
    return false;
  }

  /// Builds the suggestion body as the user types
  @override
  Widget buildSuggestions(BuildContext context) {
    context.bloc<ManualSearchBloc>()
      ..add(AutocompleteSearched(
          latitude: latitude, longitude: longitude, input: query));

    return BlocBuilder<ManualSearchBloc, ManualSearchState>(
        builder: (context, state) {
      Widget searchBody;

      if (state is AutocompleteSearchLoading) {
        searchBody = const Padding(
            padding: EdgeInsets.all(20.0), child: CircularProgressIndicator());
      }
      if (state is AutocompleteSearchSuccess) {
        final predictions =
            state.predictions.where((place) => _isAccepted(place)).toList();
        final searchedStr = state.searchedStr;

        // No results found
        if (predictions.isEmpty) {
          searchBody = Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(
                'No results found for "$searchedStr"',
                style: const TextStyle(
                    color: Colors.red,
                    fontWeight: FontWeight.bold,
                    fontSize: 18.0),
              ),
            ),
          );
        } else {
          // Construct results
          searchBody = ListView.builder(
              itemCount: predictions.length,
              itemBuilder: (context, index) {
                return _buildSearchResult(
                    context, predictions[index], searchedStr);
              });
        }
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

  /// One entry in the suggestion list
  Widget _buildSearchResult(
      BuildContext context, AutocompleteResultEntity prediction, String input) {
    final id = prediction.id.getOrCrash();
    final name = prediction.name.getOrCrash();
    final location = prediction.secondaryText;

    return ListTile(
      onTap: () {
        close(context, id);
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
              text: name.substring(0, input.length),
              style: const TextStyle(
                  fontWeight: FontWeight.w500, color: Colors.black),
              children: [
                TextSpan(
                    text: name.substring(input.length),
                    style: const TextStyle(
                        fontWeight: FontWeight.w500, color: Colors.grey))
              ])),
    );
  }
}

/// The "powered by Google" logo as required by the Places API Policies
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
