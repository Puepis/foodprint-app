part of 'restaurant_search_bloc.dart';

abstract class RestaurantSearchEvent extends Equatable {
  const RestaurantSearchEvent();
}

class NearbyRestaurantsSearched extends RestaurantSearchEvent {
  final double latitude;
  final double longitude;

  const NearbyRestaurantsSearched(
      {@required this.latitude, @required this.longitude});

  @override
  List<Object> get props => [latitude, longitude];

  @override
  String toString() =>
      'Nearby restaurants searched: { lat: $latitude, lng: $longitude}';
}

class AutocompleteRestaurantsSearched extends RestaurantSearchEvent {
  final String input;
  final double latitude;
  final double longitude;
  const AutocompleteRestaurantsSearched(
      {@required this.latitude,
      @required this.longitude,
      @required this.input});

  @override
  List<Object> get props => [input];
}
