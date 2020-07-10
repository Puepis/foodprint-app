part of 'restaurant_search_bloc.dart';

abstract class RestaurantSearchEvent extends Equatable {
  const RestaurantSearchEvent();
}

class RestaurantSearched extends RestaurantSearchEvent {
  final double latitude;
  final double longitude;

  const RestaurantSearched({@required this.latitude, @required this.longitude});

  @override
  List<Object> get props => [latitude, longitude];

  @override
  String toString() => 'Restaurants searched: { lat: $latitude, lng: $longitude}';
}
