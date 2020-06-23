import 'package:freezed_annotation/freezed_annotation.dart';

part 'location_failure.freezed.dart';

@freezed
abstract class LocationFailure with _$LocationFailure {
  const factory LocationFailure.permissionDenied() = _PermissionDenied;
  const factory LocationFailure.locationServiceDisabled() = _LocationServiceDisabled;
  const factory LocationFailure.unexpected() = _Unexpected;
}