part of 'restaurant_search_bloc.dart';

abstract class RestaurantSearchState extends Equatable {
  const RestaurantSearchState();

  @override
  List<Object> get props => [];
}

/// Initial state
class SearchStateEmpty extends RestaurantSearchState {}

/// Search pending
class SearchStateLoading extends RestaurantSearchState {}

/// Successful nearby search, contains list of [RestaurantEntity].
class NearbySearchStateSuccess extends RestaurantSearchState {
  final List<RestaurantEntity> restaurants;

  const NearbySearchStateSuccess({@required this.restaurants});

  @override
  List<Object> get props => [restaurants];

  @override
  String toString() =>
      'Nearby search successful { restaurants: ${restaurants.length} }';
}

/// An error occurred during nearby search. Contains a [RestaurantFailure].
class SearchStateError extends RestaurantSearchState {
  final RestaurantFailure failure;

  const SearchStateError({@required this.failure});

  @override
  List<Object> get props => [failure];

  @override
  String toString() => 'Search Error { error: ${failure.toString()} }';
}

