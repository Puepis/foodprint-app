import 'package:flutter/material.dart';
import 'package:foodprint/application/restaurants/restaurant_search_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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

    // TODO: Add attribution and change widgets
    // Fire event
    context.bloc<RestaurantSearchBloc>()
      ..add(AutocompleteRestaurantsSearched(
          latitude: latitude, longitude: longitude, input: query));

    return BlocBuilder<RestaurantSearchBloc, RestaurantSearchState>(
        builder: (context, state) {
      if (state is SearchStateLoading) {
        return const CircularProgressIndicator();
      }
      if (state is SearchStateError) {
        print(state.failure.toString());
        return const Text("");
      }
      if (state is AutocompleteSearchSuccess) {
        final predictions = state.predictions;
        if (state.predictions.isEmpty) {
          return const Text("No Results");
        }

        return ListView.builder(
            itemCount: predictions.length,
            itemBuilder: (context, index) {
              final name = predictions[index].name.getOrCrash();
              return ListTile(
                onTap: () {
                  showResults(context);
                },
                leading: const Icon(Icons.restaurant_menu),
                title: RichText(
                    text: TextSpan(
                        text: name.substring(0, query.length),
                        style: const TextStyle(
                            fontWeight: FontWeight.w500, color: Colors.black),
                        children: [
                      TextSpan(
                          text: name.substring(query.length),
                          style: const TextStyle(color: Colors.grey))
                    ])),
              );
            });
      }
      return Container();
    });
  }
}
