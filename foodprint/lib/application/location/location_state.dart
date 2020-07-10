part of 'location_bloc.dart';

abstract class LocationState extends Equatable {
  const LocationState();

  @override
  List<Object> get props => [];
}

class LocationStateInitial extends LocationState {}

class GetLocationSuccess extends LocationState {
  final LatLng latlng;

  const GetLocationSuccess(this.latlng);

  @override
  List<Object> get props => [latlng];

  @override
  String toString() => 'Location retrieved successfully { location: $latlng }';
}

class GetLocationFailure extends LocationState {
  final LocationFailure failure;

  const GetLocationFailure(this.failure);

  @override
  List<Object> get props => [failure];

  @override
  String toString() => 'Failed to retrieve location{ failure : $failure}';
}

