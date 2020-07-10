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

  LocalFoodprintUpdated localFoodprintUpdated(
      {@required FoodprintEntity newFoodprint}) {
    return LocalFoodprintUpdated(
      newFoodprint: newFoodprint,
    );
  }
}

// ignore: unused_element
const $FoodprintEvent = _$FoodprintEventTearOff();

mixin _$FoodprintEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result foodprintRequested(JWT token),
    @required Result localFoodprintUpdated(FoodprintEntity newFoodprint),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result foodprintRequested(JWT token),
    Result localFoodprintUpdated(FoodprintEntity newFoodprint),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result foodprintRequested(FoodprintRequested value),
    @required Result localFoodprintUpdated(LocalFoodprintUpdated value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result foodprintRequested(FoodprintRequested value),
    Result localFoodprintUpdated(LocalFoodprintUpdated value),
    @required Result orElse(),
  });
}

abstract class $FoodprintEventCopyWith<$Res> {
  factory $FoodprintEventCopyWith(
          FoodprintEvent value, $Res Function(FoodprintEvent) then) =
      _$FoodprintEventCopyWithImpl<$Res>;
}

class _$FoodprintEventCopyWithImpl<$Res>
    implements $FoodprintEventCopyWith<$Res> {
  _$FoodprintEventCopyWithImpl(this._value, this._then);

  final FoodprintEvent _value;
  // ignore: unused_field
  final $Res Function(FoodprintEvent) _then;
}

abstract class $FoodprintRequestedCopyWith<$Res> {
  factory $FoodprintRequestedCopyWith(
          FoodprintRequested value, $Res Function(FoodprintRequested) then) =
      _$FoodprintRequestedCopyWithImpl<$Res>;
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

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result foodprintRequested(JWT token),
    @required Result localFoodprintUpdated(FoodprintEntity newFoodprint),
  }) {
    assert(foodprintRequested != null);
    assert(localFoodprintUpdated != null);
    return foodprintRequested(token);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result foodprintRequested(JWT token),
    Result localFoodprintUpdated(FoodprintEntity newFoodprint),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (foodprintRequested != null) {
      return foodprintRequested(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result foodprintRequested(FoodprintRequested value),
    @required Result localFoodprintUpdated(LocalFoodprintUpdated value),
  }) {
    assert(foodprintRequested != null);
    assert(localFoodprintUpdated != null);
    return foodprintRequested(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result foodprintRequested(FoodprintRequested value),
    Result localFoodprintUpdated(LocalFoodprintUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (foodprintRequested != null) {
      return foodprintRequested(this);
    }
    return orElse();
  }
}

abstract class FoodprintRequested implements FoodprintEvent {
  const factory FoodprintRequested({@required JWT token}) =
      _$FoodprintRequested;

  JWT get token;
  $FoodprintRequestedCopyWith<FoodprintRequested> get copyWith;
}

abstract class $LocalFoodprintUpdatedCopyWith<$Res> {
  factory $LocalFoodprintUpdatedCopyWith(LocalFoodprintUpdated value,
          $Res Function(LocalFoodprintUpdated) then) =
      _$LocalFoodprintUpdatedCopyWithImpl<$Res>;
  $Res call({FoodprintEntity newFoodprint});

  $FoodprintEntityCopyWith<$Res> get newFoodprint;
}

class _$LocalFoodprintUpdatedCopyWithImpl<$Res>
    extends _$FoodprintEventCopyWithImpl<$Res>
    implements $LocalFoodprintUpdatedCopyWith<$Res> {
  _$LocalFoodprintUpdatedCopyWithImpl(
      LocalFoodprintUpdated _value, $Res Function(LocalFoodprintUpdated) _then)
      : super(_value, (v) => _then(v as LocalFoodprintUpdated));

  @override
  LocalFoodprintUpdated get _value => super._value as LocalFoodprintUpdated;

  @override
  $Res call({
    Object newFoodprint = freezed,
  }) {
    return _then(LocalFoodprintUpdated(
      newFoodprint: newFoodprint == freezed
          ? _value.newFoodprint
          : newFoodprint as FoodprintEntity,
    ));
  }

  @override
  $FoodprintEntityCopyWith<$Res> get newFoodprint {
    if (_value.newFoodprint == null) {
      return null;
    }
    return $FoodprintEntityCopyWith<$Res>(_value.newFoodprint, (value) {
      return _then(_value.copyWith(newFoodprint: value));
    });
  }
}

class _$LocalFoodprintUpdated implements LocalFoodprintUpdated {
  const _$LocalFoodprintUpdated({@required this.newFoodprint})
      : assert(newFoodprint != null);

  @override
  final FoodprintEntity newFoodprint;

  @override
  String toString() {
    return 'FoodprintEvent.localFoodprintUpdated(newFoodprint: $newFoodprint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LocalFoodprintUpdated &&
            (identical(other.newFoodprint, newFoodprint) ||
                const DeepCollectionEquality()
                    .equals(other.newFoodprint, newFoodprint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(newFoodprint);

  @override
  $LocalFoodprintUpdatedCopyWith<LocalFoodprintUpdated> get copyWith =>
      _$LocalFoodprintUpdatedCopyWithImpl<LocalFoodprintUpdated>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result foodprintRequested(JWT token),
    @required Result localFoodprintUpdated(FoodprintEntity newFoodprint),
  }) {
    assert(foodprintRequested != null);
    assert(localFoodprintUpdated != null);
    return localFoodprintUpdated(newFoodprint);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result foodprintRequested(JWT token),
    Result localFoodprintUpdated(FoodprintEntity newFoodprint),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (localFoodprintUpdated != null) {
      return localFoodprintUpdated(newFoodprint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result foodprintRequested(FoodprintRequested value),
    @required Result localFoodprintUpdated(LocalFoodprintUpdated value),
  }) {
    assert(foodprintRequested != null);
    assert(localFoodprintUpdated != null);
    return localFoodprintUpdated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result foodprintRequested(FoodprintRequested value),
    Result localFoodprintUpdated(LocalFoodprintUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (localFoodprintUpdated != null) {
      return localFoodprintUpdated(this);
    }
    return orElse();
  }
}

abstract class LocalFoodprintUpdated implements FoodprintEvent {
  const factory LocalFoodprintUpdated(
      {@required FoodprintEntity newFoodprint}) = _$LocalFoodprintUpdated;

  FoodprintEntity get newFoodprint;
  $LocalFoodprintUpdatedCopyWith<LocalFoodprintUpdated> get copyWith;
}

class _$FoodprintStateTearOff {
  const _$FoodprintStateTearOff();

  Initial initial() {
    return const Initial();
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

  FoodprintUpdated foodprintUpdated({@required FoodprintEntity foodprint}) {
    return FoodprintUpdated(
      foodprint: foodprint,
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
    @required Result foodprintUpdated(FoodprintEntity foodprint),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result inProgress(),
    Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    Result fetchFoodprintFailure(FoodprintFailure failure),
    Result foodprintUpdated(FoodprintEntity foodprint),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result inProgress(InProgress value),
    @required Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    @required Result fetchFoodprintFailure(FetchFoodprintFailure value),
    @required Result foodprintUpdated(FoodprintUpdated value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result inProgress(InProgress value),
    Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    Result fetchFoodprintFailure(FetchFoodprintFailure value),
    Result foodprintUpdated(FoodprintUpdated value),
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

abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

class _$InitialCopyWithImpl<$Res> extends _$FoodprintStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

class _$Initial implements Initial {
  const _$Initial();

  @override
  String toString() {
    return 'FoodprintState.initial()';
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
    @required Result inProgress(),
    @required Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    @required Result fetchFoodprintFailure(FoodprintFailure failure),
    @required Result foodprintUpdated(FoodprintEntity foodprint),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    assert(foodprintUpdated != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result inProgress(),
    Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    Result fetchFoodprintFailure(FoodprintFailure failure),
    Result foodprintUpdated(FoodprintEntity foodprint),
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
    @required Result inProgress(InProgress value),
    @required Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    @required Result fetchFoodprintFailure(FetchFoodprintFailure value),
    @required Result foodprintUpdated(FoodprintUpdated value),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    assert(foodprintUpdated != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result inProgress(InProgress value),
    Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    Result fetchFoodprintFailure(FetchFoodprintFailure value),
    Result foodprintUpdated(FoodprintUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements FoodprintState {
  const factory Initial() = _$Initial;
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
    @required Result foodprintUpdated(FoodprintEntity foodprint),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    assert(foodprintUpdated != null);
    return inProgress();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result inProgress(),
    Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    Result fetchFoodprintFailure(FoodprintFailure failure),
    Result foodprintUpdated(FoodprintEntity foodprint),
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
    @required Result initial(Initial value),
    @required Result inProgress(InProgress value),
    @required Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    @required Result fetchFoodprintFailure(FetchFoodprintFailure value),
    @required Result foodprintUpdated(FoodprintUpdated value),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    assert(foodprintUpdated != null);
    return inProgress(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result inProgress(InProgress value),
    Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    Result fetchFoodprintFailure(FetchFoodprintFailure value),
    Result foodprintUpdated(FoodprintUpdated value),
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
    @required Result foodprintUpdated(FoodprintEntity foodprint),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    assert(foodprintUpdated != null);
    return fetchFoodprintSuccess(foodprint);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result inProgress(),
    Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    Result fetchFoodprintFailure(FoodprintFailure failure),
    Result foodprintUpdated(FoodprintEntity foodprint),
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
    @required Result initial(Initial value),
    @required Result inProgress(InProgress value),
    @required Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    @required Result fetchFoodprintFailure(FetchFoodprintFailure value),
    @required Result foodprintUpdated(FoodprintUpdated value),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    assert(foodprintUpdated != null);
    return fetchFoodprintSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result inProgress(InProgress value),
    Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    Result fetchFoodprintFailure(FetchFoodprintFailure value),
    Result foodprintUpdated(FoodprintUpdated value),
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
    @required Result foodprintUpdated(FoodprintEntity foodprint),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    assert(foodprintUpdated != null);
    return fetchFoodprintFailure(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result inProgress(),
    Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    Result fetchFoodprintFailure(FoodprintFailure failure),
    Result foodprintUpdated(FoodprintEntity foodprint),
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
    @required Result initial(Initial value),
    @required Result inProgress(InProgress value),
    @required Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    @required Result fetchFoodprintFailure(FetchFoodprintFailure value),
    @required Result foodprintUpdated(FoodprintUpdated value),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    assert(foodprintUpdated != null);
    return fetchFoodprintFailure(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result inProgress(InProgress value),
    Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    Result fetchFoodprintFailure(FetchFoodprintFailure value),
    Result foodprintUpdated(FoodprintUpdated value),
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

abstract class $FoodprintUpdatedCopyWith<$Res> {
  factory $FoodprintUpdatedCopyWith(
          FoodprintUpdated value, $Res Function(FoodprintUpdated) then) =
      _$FoodprintUpdatedCopyWithImpl<$Res>;
  $Res call({FoodprintEntity foodprint});

  $FoodprintEntityCopyWith<$Res> get foodprint;
}

class _$FoodprintUpdatedCopyWithImpl<$Res>
    extends _$FoodprintStateCopyWithImpl<$Res>
    implements $FoodprintUpdatedCopyWith<$Res> {
  _$FoodprintUpdatedCopyWithImpl(
      FoodprintUpdated _value, $Res Function(FoodprintUpdated) _then)
      : super(_value, (v) => _then(v as FoodprintUpdated));

  @override
  FoodprintUpdated get _value => super._value as FoodprintUpdated;

  @override
  $Res call({
    Object foodprint = freezed,
  }) {
    return _then(FoodprintUpdated(
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

class _$FoodprintUpdated implements FoodprintUpdated {
  const _$FoodprintUpdated({@required this.foodprint})
      : assert(foodprint != null);

  @override
  final FoodprintEntity foodprint;

  @override
  String toString() {
    return 'FoodprintState.foodprintUpdated(foodprint: $foodprint)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is FoodprintUpdated &&
            (identical(other.foodprint, foodprint) ||
                const DeepCollectionEquality()
                    .equals(other.foodprint, foodprint)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(foodprint);

  @override
  $FoodprintUpdatedCopyWith<FoodprintUpdated> get copyWith =>
      _$FoodprintUpdatedCopyWithImpl<FoodprintUpdated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result inProgress(),
    @required Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    @required Result fetchFoodprintFailure(FoodprintFailure failure),
    @required Result foodprintUpdated(FoodprintEntity foodprint),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    assert(foodprintUpdated != null);
    return foodprintUpdated(foodprint);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result inProgress(),
    Result fetchFoodprintSuccess(FoodprintEntity foodprint),
    Result fetchFoodprintFailure(FoodprintFailure failure),
    Result foodprintUpdated(FoodprintEntity foodprint),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (foodprintUpdated != null) {
      return foodprintUpdated(foodprint);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result inProgress(InProgress value),
    @required Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    @required Result fetchFoodprintFailure(FetchFoodprintFailure value),
    @required Result foodprintUpdated(FoodprintUpdated value),
  }) {
    assert(initial != null);
    assert(inProgress != null);
    assert(fetchFoodprintSuccess != null);
    assert(fetchFoodprintFailure != null);
    assert(foodprintUpdated != null);
    return foodprintUpdated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result inProgress(InProgress value),
    Result fetchFoodprintSuccess(FetchFoodprintSuccess value),
    Result fetchFoodprintFailure(FetchFoodprintFailure value),
    Result foodprintUpdated(FoodprintUpdated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (foodprintUpdated != null) {
      return foodprintUpdated(this);
    }
    return orElse();
  }
}

abstract class FoodprintUpdated implements FoodprintState {
  const factory FoodprintUpdated({@required FoodprintEntity foodprint}) =
      _$FoodprintUpdated;

  FoodprintEntity get foodprint;
  $FoodprintUpdatedCopyWith<FoodprintUpdated> get copyWith;
}
