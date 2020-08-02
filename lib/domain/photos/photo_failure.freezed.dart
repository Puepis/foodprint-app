// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'photo_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$PhotoFailureTearOff {
  const _$PhotoFailureTearOff();

  _ServerError serverError() {
    return const _ServerError();
  }

  _InvalidPhoto invalidPhoto() {
    return const _InvalidPhoto();
  }
}

// ignore: unused_element
const $PhotoFailure = _$PhotoFailureTearOff();

mixin _$PhotoFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result invalidPhoto(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result invalidPhoto(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(_ServerError value),
    @required Result invalidPhoto(_InvalidPhoto value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(_ServerError value),
    Result invalidPhoto(_InvalidPhoto value),
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
    @required Result serverError(),
    @required Result invalidPhoto(),
  }) {
    assert(serverError != null);
    assert(invalidPhoto != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result invalidPhoto(),
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
    @required Result serverError(_ServerError value),
    @required Result invalidPhoto(_InvalidPhoto value),
  }) {
    assert(serverError != null);
    assert(invalidPhoto != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(_ServerError value),
    Result invalidPhoto(_InvalidPhoto value),
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

abstract class _$InvalidPhotoCopyWith<$Res> {
  factory _$InvalidPhotoCopyWith(
          _InvalidPhoto value, $Res Function(_InvalidPhoto) then) =
      __$InvalidPhotoCopyWithImpl<$Res>;
}

class __$InvalidPhotoCopyWithImpl<$Res> extends _$PhotoFailureCopyWithImpl<$Res>
    implements _$InvalidPhotoCopyWith<$Res> {
  __$InvalidPhotoCopyWithImpl(
      _InvalidPhoto _value, $Res Function(_InvalidPhoto) _then)
      : super(_value, (v) => _then(v as _InvalidPhoto));

  @override
  _InvalidPhoto get _value => super._value as _InvalidPhoto;
}

class _$_InvalidPhoto implements _InvalidPhoto {
  const _$_InvalidPhoto();

  @override
  String toString() {
    return 'PhotoFailure.invalidPhoto()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is _InvalidPhoto);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result invalidPhoto(),
  }) {
    assert(serverError != null);
    assert(invalidPhoto != null);
    return invalidPhoto();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result invalidPhoto(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidPhoto != null) {
      return invalidPhoto();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(_ServerError value),
    @required Result invalidPhoto(_InvalidPhoto value),
  }) {
    assert(serverError != null);
    assert(invalidPhoto != null);
    return invalidPhoto(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(_ServerError value),
    Result invalidPhoto(_InvalidPhoto value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidPhoto != null) {
      return invalidPhoto(this);
    }
    return orElse();
  }
}

abstract class _InvalidPhoto implements PhotoFailure {
  const factory _InvalidPhoto() = _$_InvalidPhoto;
}
