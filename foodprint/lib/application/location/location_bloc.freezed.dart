// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'location_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LocationEventTearOff {
  const _$LocationEventTearOff();

  LocationRequested locationRequested() {
    return const LocationRequested();
  }
}

// ignore: unused_element
const $LocationEvent = _$LocationEventTearOff();

mixin _$LocationEvent {}

abstract class $LocationEventCopyWith<$Res> {
  factory $LocationEventCopyWith(
          LocationEvent value, $Res Function(LocationEvent) then) =
      _$LocationEventCopyWithImpl<$Res>;
}

class _$LocationEventCopyWithImpl<$Res>
    implements $LocationEventCopyWith<$Res> {
  _$LocationEventCopyWithImpl(this._value, this._then);

  final LocationEvent _value;
  // ignore: unused_field
  final $Res Function(LocationEvent) _then;
}

abstract class $LocationRequestedCopyWith<$Res> {
  factory $LocationRequestedCopyWith(
          LocationRequested value, $Res Function(LocationRequested) then) =
      _$LocationRequestedCopyWithImpl<$Res>;
}

class _$LocationRequestedCopyWithImpl<$Res>
    extends _$LocationEventCopyWithImpl<$Res>
    implements $LocationRequestedCopyWith<$Res> {
  _$LocationRequestedCopyWithImpl(
      LocationRequested _value, $Res Function(LocationRequested) _then)
      : super(_value, (v) => _then(v as LocationRequested));

  @override
  LocationRequested get _value => super._value as LocationRequested;
}

class _$LocationRequested
    with DiagnosticableTreeMixin
    implements LocationRequested {
  const _$LocationRequested();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocationEvent.locationRequested()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocationEvent.locationRequested'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is LocationRequested);
  }

  @override
  int get hashCode => runtimeType.hashCode;
}

abstract class LocationRequested implements LocationEvent {
  const factory LocationRequested() = _$LocationRequested;
}

class _$LocationStateTearOff {
  const _$LocationStateTearOff();

  Initial initial() {
    return const Initial();
  }

  GetLocationSuccess getLocationSuccess({@required LatLng latlng}) {
    return GetLocationSuccess(
      latlng: latlng,
    );
  }

  GetLocationFailure getLocationFailure({@required LocationFailure failure}) {
    return GetLocationFailure(
      failure: failure,
    );
  }
}

// ignore: unused_element
const $LocationState = _$LocationStateTearOff();

mixin _$LocationState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result getLocationSuccess(LatLng latlng),
    @required Result getLocationFailure(LocationFailure failure),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getLocationSuccess(LatLng latlng),
    Result getLocationFailure(LocationFailure failure),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result getLocationSuccess(GetLocationSuccess value),
    @required Result getLocationFailure(GetLocationFailure value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result getLocationSuccess(GetLocationSuccess value),
    Result getLocationFailure(GetLocationFailure value),
    @required Result orElse(),
  });
}

abstract class $LocationStateCopyWith<$Res> {
  factory $LocationStateCopyWith(
          LocationState value, $Res Function(LocationState) then) =
      _$LocationStateCopyWithImpl<$Res>;
}

class _$LocationStateCopyWithImpl<$Res>
    implements $LocationStateCopyWith<$Res> {
  _$LocationStateCopyWithImpl(this._value, this._then);

  final LocationState _value;
  // ignore: unused_field
  final $Res Function(LocationState) _then;
}

abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

class _$InitialCopyWithImpl<$Res> extends _$LocationStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

class _$Initial with DiagnosticableTreeMixin implements Initial {
  const _$Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocationState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'LocationState.initial'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Initial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result getLocationSuccess(LatLng latlng),
    @required Result getLocationFailure(LocationFailure failure),
  }) {
    assert(initial != null);
    assert(getLocationSuccess != null);
    assert(getLocationFailure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getLocationSuccess(LatLng latlng),
    Result getLocationFailure(LocationFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result getLocationSuccess(GetLocationSuccess value),
    @required Result getLocationFailure(GetLocationFailure value),
  }) {
    assert(initial != null);
    assert(getLocationSuccess != null);
    assert(getLocationFailure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result getLocationSuccess(GetLocationSuccess value),
    Result getLocationFailure(GetLocationFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements LocationState {
  const factory Initial() = _$Initial;
}

abstract class $GetLocationSuccessCopyWith<$Res> {
  factory $GetLocationSuccessCopyWith(
          GetLocationSuccess value, $Res Function(GetLocationSuccess) then) =
      _$GetLocationSuccessCopyWithImpl<$Res>;
  $Res call({LatLng latlng});
}

class _$GetLocationSuccessCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements $GetLocationSuccessCopyWith<$Res> {
  _$GetLocationSuccessCopyWithImpl(
      GetLocationSuccess _value, $Res Function(GetLocationSuccess) _then)
      : super(_value, (v) => _then(v as GetLocationSuccess));

  @override
  GetLocationSuccess get _value => super._value as GetLocationSuccess;

  @override
  $Res call({
    Object latlng = freezed,
  }) {
    return _then(GetLocationSuccess(
      latlng: latlng == freezed ? _value.latlng : latlng as LatLng,
    ));
  }
}

class _$GetLocationSuccess
    with DiagnosticableTreeMixin
    implements GetLocationSuccess {
  const _$GetLocationSuccess({@required this.latlng}) : assert(latlng != null);

  @override
  final LatLng latlng;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocationState.getLocationSuccess(latlng: $latlng)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocationState.getLocationSuccess'))
      ..add(DiagnosticsProperty('latlng', latlng));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetLocationSuccess &&
            (identical(other.latlng, latlng) ||
                const DeepCollectionEquality().equals(other.latlng, latlng)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(latlng);

  @override
  $GetLocationSuccessCopyWith<GetLocationSuccess> get copyWith =>
      _$GetLocationSuccessCopyWithImpl<GetLocationSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result getLocationSuccess(LatLng latlng),
    @required Result getLocationFailure(LocationFailure failure),
  }) {
    assert(initial != null);
    assert(getLocationSuccess != null);
    assert(getLocationFailure != null);
    return getLocationSuccess(latlng);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getLocationSuccess(LatLng latlng),
    Result getLocationFailure(LocationFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getLocationSuccess != null) {
      return getLocationSuccess(latlng);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result getLocationSuccess(GetLocationSuccess value),
    @required Result getLocationFailure(GetLocationFailure value),
  }) {
    assert(initial != null);
    assert(getLocationSuccess != null);
    assert(getLocationFailure != null);
    return getLocationSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result getLocationSuccess(GetLocationSuccess value),
    Result getLocationFailure(GetLocationFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getLocationSuccess != null) {
      return getLocationSuccess(this);
    }
    return orElse();
  }
}

abstract class GetLocationSuccess implements LocationState {
  const factory GetLocationSuccess({@required LatLng latlng}) =
      _$GetLocationSuccess;

  LatLng get latlng;
  $GetLocationSuccessCopyWith<GetLocationSuccess> get copyWith;
}

abstract class $GetLocationFailureCopyWith<$Res> {
  factory $GetLocationFailureCopyWith(
          GetLocationFailure value, $Res Function(GetLocationFailure) then) =
      _$GetLocationFailureCopyWithImpl<$Res>;
  $Res call({LocationFailure failure});

  $LocationFailureCopyWith<$Res> get failure;
}

class _$GetLocationFailureCopyWithImpl<$Res>
    extends _$LocationStateCopyWithImpl<$Res>
    implements $GetLocationFailureCopyWith<$Res> {
  _$GetLocationFailureCopyWithImpl(
      GetLocationFailure _value, $Res Function(GetLocationFailure) _then)
      : super(_value, (v) => _then(v as GetLocationFailure));

  @override
  GetLocationFailure get _value => super._value as GetLocationFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(GetLocationFailure(
      failure: failure == freezed ? _value.failure : failure as LocationFailure,
    ));
  }

  @override
  $LocationFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $LocationFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

class _$GetLocationFailure
    with DiagnosticableTreeMixin
    implements GetLocationFailure {
  const _$GetLocationFailure({@required this.failure})
      : assert(failure != null);

  @override
  final LocationFailure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LocationState.getLocationFailure(failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LocationState.getLocationFailure'))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is GetLocationFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $GetLocationFailureCopyWith<GetLocationFailure> get copyWith =>
      _$GetLocationFailureCopyWithImpl<GetLocationFailure>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result getLocationSuccess(LatLng latlng),
    @required Result getLocationFailure(LocationFailure failure),
  }) {
    assert(initial != null);
    assert(getLocationSuccess != null);
    assert(getLocationFailure != null);
    return getLocationFailure(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result getLocationSuccess(LatLng latlng),
    Result getLocationFailure(LocationFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getLocationFailure != null) {
      return getLocationFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result getLocationSuccess(GetLocationSuccess value),
    @required Result getLocationFailure(GetLocationFailure value),
  }) {
    assert(initial != null);
    assert(getLocationSuccess != null);
    assert(getLocationFailure != null);
    return getLocationFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result getLocationSuccess(GetLocationSuccess value),
    Result getLocationFailure(GetLocationFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (getLocationFailure != null) {
      return getLocationFailure(this);
    }
    return orElse();
  }
}

abstract class GetLocationFailure implements LocationState {
  const factory GetLocationFailure({@required LocationFailure failure}) =
      _$GetLocationFailure;

  LocationFailure get failure;
  $GetLocationFailureCopyWith<GetLocationFailure> get copyWith;
}
