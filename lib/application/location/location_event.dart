part of 'location_bloc.dart';


abstract class LocationEvent extends Equatable {
  const LocationEvent();
}

class LocationRequested extends LocationEvent {
  @override
  List<Object> get props => [];

  @override
  String toString() => 'Location requested';
}