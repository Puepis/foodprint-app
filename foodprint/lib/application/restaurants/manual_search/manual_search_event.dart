part of 'manual_search_bloc.dart';

abstract class ManualSearchEvent extends Equatable {
  const ManualSearchEvent();

  @override
  List<Object> get props => [];
}

class AutocompleteSearched extends ManualSearchEvent {
  final String input;
  final double latitude;
  final double longitude;
  const AutocompleteSearched(
      {@required this.latitude,
      @required this.longitude,
      @required this.input});

  @override
  List<Object> get props => [input];
}

class RestaurantDetailSearched extends ManualSearchEvent {
  final String id;
  const RestaurantDetailSearched({@required this.id}) : assert(id != null);

  @override
  List<Object> get props => [id];
}

class ResetManualSearch extends ManualSearchEvent {}
