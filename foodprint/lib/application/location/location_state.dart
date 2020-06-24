part of 'location_bloc.dart';

@freezed 
abstract class LocationState with _$LocationState {
  const factory LocationState.initial() = Initial;
  const factory LocationState.getLocationSuccess({
    @required LatLng latlng 
  }) = GetLocationSuccess;
  const factory LocationState.getLocationFailure({
    @required LocationFailure failure
  }) = GetLocationFailure;
}
