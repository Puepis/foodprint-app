// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'foodprint_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$FoodprintEventTearOff {
  const _$FoodprintEventTearOff();

  FoodprintRequested foodprintRequested({@required JWT token}) {
    return FoodprintRequested(
      token: token,
    );
  }
}

// ignore: unused_element
const $FoodprintEvent = _$FoodprintEventTearOff();

mixin _$FoodprintEvent {
  JWT get token;

  $FoodprintEventCopyWith<FoodprintEvent> get copyWith;
}

abstract class $FoodprintEventCopyWith<$Res> {
  factory $FoodprintEventCopyWith(
          FoodprintEvent value, $Res Function(FoodprintEvent) then) =
      _$FoodprintEventCopyWithImpl<$Res>;
  $Res call({JWT token});
}

class _$FoodprintEventCopyWithImpl<$Res>
    implements $FoodprintEventCopyWith<$Res> {
  _$FoodprintEventCopyWithImpl(this._value, this._then);

  final FoodprintEvent _value;
  // ignore: unused_field
  final $Res Function(FoodprintEvent) _then;

  @override
  $Res call({
    Object token = freezed,
  }) {
    return _then(_value.copyWith(
      token: token == freezed ? _value.token : token as JWT,
    ));
  }
}

abstract class $FoodprintRequestedCopyWith<$Res>
    implements $FoodprintEventCopyWith<$Res> {
  factory $FoodprintRequestedCopyWith(
          FoodprintRequested value, $Res Function(FoodprintRequested) then) =
      _$FoodprintRequestedCopyWithImpl<$Res>;
  @override
  $Res call({JWT token});
}

class _$FoodprintRequestedCopyWithImpl<$Res>
    extends _$FoodprintEventCopyWithImpl<$Res>
    implements $FoodprintRequestedCopyWith<$Res> {
  _$FoodprintRequestedCopyWithImpl(
      FoodprintRequested _value, $Res Function(FoodprintRequested) _then)
      : super(_value, (v) => _then(v as FoodprintRequested));

  @override
  FoodprintRequested get _value => super._value as FoodprintRequested;

  @override
  $Res call({
    Object token = freezed,
  }) {
    return _then(FoodprintRequested(
      token: token == freezed ? _value.token : token as JWT,
    ));
  }
}

class _$FoodprintRequested implements FoodprintRequested {
  const _$FoodprintRequested({@required this.token}) : assert(token != null);

  @override
  final JWT token;

  @override
  String toString() {
    return 'FoodprintEvent.foodprintRequested(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FoodprintRequested &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(token);

  @override
  $FoodprintRequestedCopyWith<FoodprintRequested> get copyWith =>
      _$FoodprintRequestedCopyWithImpl<FoodprintRequested>(this, _$identity);
}

abstract class FoodprintRequested implements FoodprintEvent {
  const factory FoodprintRequested({@required JWT token}) =
      _$FoodprintRequested;

  @override
  JWT get token;
  @override
  $FoodprintRequestedCopyWith<FoodprintRequested> get copyWith;
}

class _$FoodprintStateTearOff {
  const _$FoodprintStateTearOff();

  FoodprintStateInitial initial() {
    return const FoodprintStateInitial();
  }

  InProgress inProgress() {
    return const InProgress();
  }

  FetchFoodprintSuccess fetchFoodprintSuccess(
      {@required FoodprintEntity foodprint}) {
    return FetchFoodprintSuccess(
      foodprint: foodprint,
    );
  }

  FetchFoodprintFailure fetchFoodprintFailure(FoodprintFailure failure) {
    return FetchFoodprintFailure(
      failure,
    );
  }
}

// ignore: unused_element
const $FoodprintState = _$FoodprintStateTearOff();

mixin _$FoodprintState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result inProgress(),
    @required Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    @required Result fetchFoodprintFailure(FoodprintFailure failure),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result inProgress(),
    Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    Result fetchFoodprintFailure(FoodprintFailure failure),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(FoodprintStateInitial value),
    @required Result inProgress(InProgress value),
    @required Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    @required Result fetchFoodprintFailure(FetchFoodprintFailure value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(FoodprintStateInitial value),
    Result inProgress(InProgress value),
    Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    Result fetchFoodprintFailure(FetchFoodprintFailure value),
    @required Result orElse(),
  });
}

abstract class $FoodprintStateCopyWith<$Res> {
  factory $FoodprintStateCopyWith(
          FoodprintState value, $Res Function(FoodprintState) then) =
      _$FoodprintStateCopyWithImpl<$Res>;
}

class _$FoodprintStateCopyWithImpl<$Res>
    implements $FoodprintStateCopyWith<$Res> {
  _$FoodprintStateCopyWithImpl(this._value, this._then);

  final FoodprintState _value;
  // ignore: unused_field
  final $Res Function(FoodprintState) _then;
}

abstract class $FoodprintStateInitialCopyWith<$Res> {
  factory $FoodprintStateInitialCopyWith(FoodprintStateInitial value,
          $Res Function(FoodprintStateInitial) then) =
      _$FoodprintStateInitialCopyWithImpl<$Res>;
}

class _$FoodprintStateInitialCopyWithImpl<$Res>
    extends _$FoodprintStateCopyWithImpl<$Res>
    implements $FoodprintStateInitialCopyWith<$Res> {
  _$FoodprintStateInitialCopyWithImpl(
      FoodprintStateInitial _value, $Res Function(FoodprintStateInitial) _then)
      : super(_value, (v) => _then(v as FoodprintStateInitial));

  @override
  FoodprintStateInitial get _value => super._value as FoodprintStateInitial;
}

class _$FoodprintStateInitial implements FoodprintStateInitial {
  const _$FoodprintStateInitial();

  @override
  String toString() {
    return 'FoodprintState.initial()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is FoodprintStateInitial);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result inProgress(),
    @required Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    @required Result fetchFoodprintFailure(FoodprintFailure failure),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result inProgress(),
    Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    Result fetchFoodprintFailure(FoodprintFailure failure),
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
    @required Result initial(FoodprintStateInitial value),
    @required Result inProgress(InProgress value),
    @required Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    @required Result fetchFoodprintFailure(FetchFoodprintFailure value),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(FoodprintStateInitial value),
    Result inProgress(InProgress value),
    Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    Result fetchFoodprintFailure(FetchFoodprintFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class FoodprintStateInitial implements FoodprintState {
  const factory FoodprintStateInitial() = _$FoodprintStateInitial;
}

abstract class $InProgressCopyWith<$Res> {
  factory $InProgressCopyWith(
          InProgress value, $Res Function(InProgress) then) =
      _$InProgressCopyWithImpl<$Res>;
}

class _$InProgressCopyWithImpl<$Res> extends _$FoodprintStateCopyWithImpl<$Res>
    implements $InProgressCopyWith<$Res> {
  _$InProgressCopyWithImpl(InProgress _value, $Res Function(InProgress) _then)
      : super(_value, (v) => _then(v as InProgress));

  @override
  InProgress get _value => super._value as InProgress;
}

class _$InProgress implements InProgress {
  const _$InProgress();

  @override
  String toString() {
    return 'FoodprintState.inProgress()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InProgress);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result inProgress(),
    @required Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    @required Result fetchFoodprintFailure(FoodprintFailure failure),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    return inProgress();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result inProgress(),
    Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    Result fetchFoodprintFailure(FoodprintFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (inProgress != null) {
      return inProgress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(FoodprintStateInitial value),
    @required Result inProgress(InProgress value),
    @required Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    @required Result fetchFoodprintFailure(FetchFoodprintFailure value),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(FoodprintStateInitial value),
    Result inProgress(InProgress value),
    Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    Result fetchFoodprintFailure(FetchFoodprintFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (inProgress != null) {
      return inProgress(this);
    }
    return orElse();
  }
}

abstract class InProgress implements FoodprintState {
  const factory InProgress() = _$InProgress;
}

abstract class $FetchFoodprintSuccessCopyWith<$Res> {
  factory $FetchFoodprintSuccessCopyWith(FetchFoodprintSuccess value,
          $Res Function(FetchFoodprintSuccess) then) =
      _$FetchFoodprintSuccessCopyWithImpl<$Res>;
  $Res call({FoodprintEntity foodprint});

  $FoodprintEntityCopyWith<$Res> get foodprint;
}

class _$FetchFoodprintSuccessCopyWithImpl<$Res>
    extends _$FoodprintStateCopyWithImpl<$Res>
    implements $FetchFoodprintSuccessCopyWith<$Res> {
  _$FetchFoodprintSuccessCopyWithImpl(
      FetchFoodprintSuccess _value, $Res Function(FetchFoodprintSuccess) _then)
      : super(_value, (v) => _then(v as FetchFoodprintSuccess));

  @override
  FetchFoodprintSuccess get _value => super._value as FetchFoodprintSuccess;

  @override
  $Res call({
    Object foodprint = freezed,
  }) {
    return _then(FetchFoodprintSuccess(
      foodprint: foodprint == freezed
          ? _value.foodprint
          : foodprint as FoodprintEntity,
    ));
  }

  @override
  $FoodprintEntityCopyWith<$Res> get foodprint {
    if (_value.foodprint == null) {
      return null;
    }
    return $FoodprintEntityCopyWith<$Res>(_value.foodprint, (value) {
      return _then(_value.copyWith(foodprint: value));
    });
  }
}

class _$FetchFoodprintSuccess implements FetchFoodprintSuccess {
  const _$FetchFoodprintSuccess({@required this.foodprint})
      : assert(foodprint != null);

  @override
  final FoodprintEntity foodprint;

  @override
  String toString() {
    return 'FoodprintState.fetchFoodprintSuccess(foodprint: $foodprint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchFoodprintSuccess &&
            (identical(other.foodprint, foodprint) ||
                const DeepCollectionEquality()
                    .equals(other.foodprint, foodprint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(foodprint);

  @override
  $FetchFoodprintSuccessCopyWith<FetchFoodprintSuccess> get copyWith =>
      _$FetchFoodprintSuccessCopyWithImpl<FetchFoodprintSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result inProgress(),
    @required Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    @required Result fetchFoodprintFailure(FoodprintFailure failure),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    return fetchFoodprintSuccess(foodprint);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result inProgress(),
    Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    Result fetchFoodprintFailure(FoodprintFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchFoodprintSuccess != null) {
      return fetchFoodprintSuccess(foodprint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(FoodprintStateInitial value),
    @required Result inProgress(InProgress value),
    @required Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    @required Result fetchFoodprintFailure(FetchFoodprintFailure value),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    return fetchFoodprintSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(FoodprintStateInitial value),
    Result inProgress(InProgress value),
    Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    Result fetchFoodprintFailure(FetchFoodprintFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchFoodprintSuccess != null) {
      return fetchFoodprintSuccess(this);
    }
    return orElse();
  }
}

abstract class FetchFoodprintSuccess implements FoodprintState {
  const factory FetchFoodprintSuccess({@required FoodprintEntity foodprint}) =
      _$FetchFoodprintSuccess;

  FoodprintEntity get foodprint;
  $FetchFoodprintSuccessCopyWith<FetchFoodprintSuccess> get copyWith;
}

abstract class $FetchFoodprintFailureCopyWith<$Res> {
  factory $FetchFoodprintFailureCopyWith(FetchFoodprintFailure value,
          $Res Function(FetchFoodprintFailure) then) =
      _$FetchFoodprintFailureCopyWithImpl<$Res>;
  $Res call({FoodprintFailure failure});

  $FoodprintFailureCopyWith<$Res> get failure;
}

class _$FetchFoodprintFailureCopyWithImpl<$Res>
    extends _$FoodprintStateCopyWithImpl<$Res>
    implements $FetchFoodprintFailureCopyWith<$Res> {
  _$FetchFoodprintFailureCopyWithImpl(
      FetchFoodprintFailure _value, $Res Function(FetchFoodprintFailure) _then)
      : super(_value, (v) => _then(v as FetchFoodprintFailure));

  @override
  FetchFoodprintFailure get _value => super._value as FetchFoodprintFailure;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(FetchFoodprintFailure(
      failure == freezed ? _value.failure : failure as FoodprintFailure,
    ));
  }

  @override
  $FoodprintFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $FoodprintFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

class _$FetchFoodprintFailure implements FetchFoodprintFailure {
  const _$FetchFoodprintFailure(this.failure) : assert(failure != null);

  @override
  final FoodprintFailure failure;

  @override
  String toString() {
    return 'FoodprintState.fetchFoodprintFailure(failure: $failure)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FetchFoodprintFailure &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $FetchFoodprintFailureCopyWith<FetchFoodprintFailure> get copyWith =>
      _$FetchFoodprintFailureCopyWithImpl<FetchFoodprintFailure>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result inProgress(),
    @required Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    @required Result fetchFoodprintFailure(FoodprintFailure failure),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    return fetchFoodprintFailure(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result inProgress(),
    Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    Result fetchFoodprintFailure(FoodprintFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchFoodprintFailure != null) {
      return fetchFoodprintFailure(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(FoodprintStateInitial value),
    @required Result inProgress(InProgress value),
    @required Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    @required Result fetchFoodprintFailure(FetchFoodprintFailure value),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    return fetchFoodprintFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(FoodprintStateInitial value),
    Result inProgress(InProgress value),
    Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    Result fetchFoodprintFailure(FetchFoodprintFailure value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (fetchFoodprintFailure != null) {
      return fetchFoodprintFailure(this);
    }
    return orElse();
  }
}

abstract class FetchFoodprintFailure implements FoodprintState {
  const factory FetchFoodprintFailure(FoodprintFailure failure) =
      _$FetchFoodprintFailure;

  FoodprintFailure get failure;
  $FetchFoodprintFailureCopyWith<FetchFoodprintFailure> get copyWith;
}
