part of 'manual_search_bloc.dart';

abstract class ManualSearchState extends Equatable {
  const ManualSearchState();

  @override
  List<Object> get props => [];
}

class ManualSearchInitial extends ManualSearchState {}

/// No text has been entered in the search bar yet
class AutocompleteSearchEmptyState extends ManualSearchState {}

/// Search pending
class AutocompleteSearchLoading extends ManualSearchState {}

class PlaceDetailSearchLoading extends ManualSearchState {}

class AutocompleteSearchSuccess extends ManualSearchState {
  final List<AutocompleteResultEntity> predictions;

  const AutocompleteSearchSuccess({@required this.predictions});

  @override
  List<Object> get props => [predictions];

  @override
  String toString() =>
      'Autocomplete search successful { predictions : ${predictions.length} }';
}

class PlaceDetailSearchSuccess extends ManualSearchState {
  final RestaurantEntity restaurant;

  const PlaceDetailSearchSuccess({@required this.restaurant});

  @override
  List<Object> get props => [restaurant];

  @override
  String toString() =>
      'Place detail search successful { restaurant : ${restaurant.toString()} }';
}

/// An error occurred during any kind of search. Contains a [RestaurantFailure].
class SearchStateError extends ManualSearchState {
  final RestaurantFailure failure;

  const SearchStateError({@required this.failure});

  @override
  List<Object> get props => [failure];

  @override
  String toString() => 'Search Error { error: ${failure.toString()} }';
}
