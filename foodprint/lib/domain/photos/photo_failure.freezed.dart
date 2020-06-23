// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'photo_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PhotoFailureTearOff {
  const _$PhotoFailureTearOff();

  _Unexpected unexpected() {
    return const _Unexpected();
  }

  _ServerError serverError() {
    return const _ServerError();
  }
}

// ignore: unused_element
const $PhotoFailure = _$PhotoFailureTearOff();

mixin _$PhotoFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(),
    @required Result serverError(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(),
    Result serverError(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
    @required Result serverError(_ServerError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result serverError(_ServerError value),
    @required Result orElse(),
  });
}

abstract class $PhotoFailureCopyWith<$Res> {
  factory $PhotoFailureCopyWith(
          PhotoFailure value, $Res Function(PhotoFailure) then) =
      _$PhotoFailureCopyWithImpl<$Res>;
}

class _$PhotoFailureCopyWithImpl<$Res> implements $PhotoFailureCopyWith<$Res> {
  _$PhotoFailureCopyWithImpl(this._value, this._then);

  final PhotoFailure _value;
  // ignore: unused_field
  final $Res Function(PhotoFailure) _then;
}

abstract class _$UnexpectedCopyWith<$Res> {
  factory _$UnexpectedCopyWith(
          _Unexpected value, $Res Function(_Unexpected) then) =
      __$UnexpectedCopyWithImpl<$Res>;
}

class __$UnexpectedCopyWithImpl<$Res> extends _$PhotoFailureCopyWithImpl<$Res>
    implements _$UnexpectedCopyWith<$Res> {
  __$UnexpectedCopyWithImpl(
      _Unexpected _value, $Res Function(_Unexpected) _then)
      : super(_value, (v) => _then(v as _Unexpected));

  @override
  _Unexpected get _value => super._value as _Unexpected;
}

class _$_Unexpected implements _Unexpected {
  const _$_Unexpected();

  @override
  String toString() {
    return 'PhotoFailure.unexpected()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _Unexpected);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(),
    @required Result serverError(),
  }) {
    assert(unexpected != null);
    assert(serverError != null);
    return unexpected();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(),
    Result serverError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
    @required Result serverError(_ServerError value),
  }) {
    assert(unexpected != null);
    assert(serverError != null);
    return unexpected(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result serverError(_ServerError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unexpected != null) {
      return unexpected(this);
    }
    return orElse();
  }
}

abstract class _Unexpected implements PhotoFailure {
  const factory _Unexpected() = _$_Unexpected;
}

abstract class _$ServerErrorCopyWith<$Res> {
  factory _$ServerErrorCopyWith(
          _ServerError value, $Res Function(_ServerError) then) =
      __$ServerErrorCopyWithImpl<$Res>;
}

class __$ServerErrorCopyWithImpl<$Res> extends _$PhotoFailureCopyWithImpl<$Res>
    implements _$ServerErrorCopyWith<$Res> {
  __$ServerErrorCopyWithImpl(
      _ServerError _value, $Res Function(_ServerError) _then)
      : super(_value, (v) => _then(v as _ServerError));

  @override
  _ServerError get _value => super._value as _ServerError;
}

class _$_ServerError implements _ServerError {
  const _$_ServerError();

  @override
  String toString() {
    return 'PhotoFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result unexpected(),
    @required Result serverError(),
  }) {
    assert(unexpected != null);
    assert(serverError != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result unexpected(),
    Result serverError(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result unexpected(_Unexpected value),
    @required Result serverError(_ServerError value),
  }) {
    assert(unexpected != null);
    assert(serverError != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result unexpected(_Unexpected value),
    Result serverError(_ServerError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class _ServerError implements PhotoFailure {
  const factory _ServerError() = _$_ServerError;
}
