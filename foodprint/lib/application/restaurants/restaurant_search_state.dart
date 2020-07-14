part of 'restaurant_search_bloc.dart';

abstract class RestaurantSearchState extends Equatable {
  const RestaurantSearchState();

  @override
  List<Object> get props => [];
}

// No search yet
class SearchStateEmpty extends RestaurantSearchState {}

// Search pending
class SearchStateLoading extends RestaurantSearchState {}

// Successful search, contains list of restaurants
class NearbySearchStateSuccess extends RestaurantSearchState {
  final List<RestaurantEntity> restaurants;

  const NearbySearchStateSuccess({@required this.restaurants});

  @override
  List<Object> get props => [restaurants];

  @override
  String toString() =>
      'Nearby search successful { restaurants: ${restaurants.length} }';
}

// Successful search, contains list of restaurants
class AutocompleteSearchSuccess extends RestaurantSearchState {
  final List<AutocompleteResultEntity> predictions;

  const AutocompleteSearchSuccess({@required this.predictions});

  @override
  List<Object> get props => [predictions];

  @override
  String toString() =>
      'Autocomplete search successful { predictions : ${predictions.length} }';
}

// Error during search
class SearchStateError extends RestaurantSearchState {
  final RestaurantFailure failure;

  const SearchStateError({@required this.failure});

  @override
  List<Object> get props => [failure];

  @override
  String toString() => 'Search Error { error: ${failure.toString()} }';
}
