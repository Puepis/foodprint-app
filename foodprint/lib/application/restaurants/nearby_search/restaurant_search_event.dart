part of 'restaurant_search_bloc.dart';

abstract class RestaurantSearchEvent extends Equatable {
  const RestaurantSearchEvent();

  @override
  List<Object> get props => [];
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

class ResetNearbySearch extends RestaurantSearchEvent {}
