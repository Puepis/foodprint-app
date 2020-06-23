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
class SearchStateSuccess extends RestaurantSearchState {
  final List<RestaurantEntity> restaurants;

  const SearchStateSuccess(this.restaurants);

  @override
  List<Object> get props => [restaurants];

  @override
  String toString() => 'Search Successful { restaurants: ${restaurants.length} }';
}

// Error during search
class SearchStateError extends RestaurantSearchState {
  final RestaurantFailure failure;

  const SearchStateError(this.failure);

  @override
  List<Object> get props => [failure];

  @override
  String toString() => 'Search Error { error: ${failure.toString()} }';
}