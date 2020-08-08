// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'login_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$LoginFailureTearOff {
  const _$LoginFailureTearOff();

  ServerError serverError() {
    return const ServerError();
  }

  InvalidLoginCombination invalidLoginCombination() {
    return const InvalidLoginCombination();
  }

  NoInternet noInternet() {
    return const NoInternet();
  }
}

// ignore: unused_element
const $LoginFailure = _$LoginFailureTearOff();

mixin _$LoginFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result invalidLoginCombination(),
    @required Result noInternet(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result invalidLoginCombination(),
    Result noInternet(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result invalidLoginCombination(InvalidLoginCombination value),
    @required Result noInternet(NoInternet value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result invalidLoginCombination(InvalidLoginCombination value),
    Result noInternet(NoInternet value),
    @required Result orElse(),
  });
}

abstract class $LoginFailureCopyWith<$Res> {
  factory $LoginFailureCopyWith(
          LoginFailure value, $Res Function(LoginFailure) then) =
      _$LoginFailureCopyWithImpl<$Res>;
}

class _$LoginFailureCopyWithImpl<$Res> implements $LoginFailureCopyWith<$Res> {
  _$LoginFailureCopyWithImpl(this._value, this._then);

  final LoginFailure _value;
  // ignore: unused_field
  final $Res Function(LoginFailure) _then;
}

abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

class _$ServerErrorCopyWithImpl<$Res> extends _$LoginFailureCopyWithImpl<$Res>
    implements $ServerErrorCopyWith<$Res> {
  _$ServerErrorCopyWithImpl(
      ServerError _value, $Res Function(ServerError) _then)
      : super(_value, (v) => _then(v as ServerError));

  @override
  ServerError get _value => super._value as ServerError;
}

class _$ServerError implements ServerError {
  const _$ServerError();

  @override
  String toString() {
    return 'LoginFailure.serverError()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is ServerError);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result invalidLoginCombination(),
    @required Result noInternet(),
  }) {
    assert(serverError != null);
    assert(invalidLoginCombination != null);
    assert(noInternet != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result invalidLoginCombination(),
    Result noInternet(),
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
    @required Result serverError(ServerError value),
    @required Result invalidLoginCombination(InvalidLoginCombination value),
    @required Result noInternet(NoInternet value),
  }) {
    assert(serverError != null);
    assert(invalidLoginCombination != null);
    assert(noInternet != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result invalidLoginCombination(InvalidLoginCombination value),
    Result noInternet(NoInternet value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (serverError != null) {
      return serverError(this);
    }
    return orElse();
  }
}

abstract class ServerError implements LoginFailure {
  const factory ServerError() = _$ServerError;
}

abstract class $InvalidLoginCombinationCopyWith<$Res> {
  factory $InvalidLoginCombinationCopyWith(InvalidLoginCombination value,
          $Res Function(InvalidLoginCombination) then) =
      _$InvalidLoginCombinationCopyWithImpl<$Res>;
}

class _$InvalidLoginCombinationCopyWithImpl<$Res>
    extends _$LoginFailureCopyWithImpl<$Res>
    implements $InvalidLoginCombinationCopyWith<$Res> {
  _$InvalidLoginCombinationCopyWithImpl(InvalidLoginCombination _value,
      $Res Function(InvalidLoginCombination) _then)
      : super(_value, (v) => _then(v as InvalidLoginCombination));

  @override
  InvalidLoginCombination get _value => super._value as InvalidLoginCombination;
}

class _$InvalidLoginCombination implements InvalidLoginCombination {
  const _$InvalidLoginCombination();

  @override
  String toString() {
    return 'LoginFailure.invalidLoginCombination()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidLoginCombination);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result invalidLoginCombination(),
    @required Result noInternet(),
  }) {
    assert(serverError != null);
    assert(invalidLoginCombination != null);
    assert(noInternet != null);
    return invalidLoginCombination();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result invalidLoginCombination(),
    Result noInternet(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidLoginCombination != null) {
      return invalidLoginCombination();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result invalidLoginCombination(InvalidLoginCombination value),
    @required Result noInternet(NoInternet value),
  }) {
    assert(serverError != null);
    assert(invalidLoginCombination != null);
    assert(noInternet != null);
    return invalidLoginCombination(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result invalidLoginCombination(InvalidLoginCombination value),
    Result noInternet(NoInternet value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidLoginCombination != null) {
      return invalidLoginCombination(this);
    }
    return orElse();
  }
}

abstract class InvalidLoginCombination implements LoginFailure {
  const factory InvalidLoginCombination() = _$InvalidLoginCombination;
}

abstract class $NoInternetCopyWith<$Res> {
  factory $NoInternetCopyWith(
          NoInternet value, $Res Function(NoInternet) then) =
      _$NoInternetCopyWithImpl<$Res>;
}

class _$NoInternetCopyWithImpl<$Res> extends _$LoginFailureCopyWithImpl<$Res>
    implements $NoInternetCopyWith<$Res> {
  _$NoInternetCopyWithImpl(NoInternet _value, $Res Function(NoInternet) _then)
      : super(_value, (v) => _then(v as NoInternet));

  @override
  NoInternet get _value => super._value as NoInternet;
}

class _$NoInternet implements NoInternet {
  const _$NoInternet();

  @override
  String toString() {
    return 'LoginFailure.noInternet()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is NoInternet);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result invalidLoginCombination(),
    @required Result noInternet(),
  }) {
    assert(serverError != null);
    assert(invalidLoginCombination != null);
    assert(noInternet != null);
    return noInternet();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result invalidLoginCombination(),
    Result noInternet(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noInternet != null) {
      return noInternet();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result invalidLoginCombination(InvalidLoginCombination value),
    @required Result noInternet(NoInternet value),
  }) {
    assert(serverError != null);
    assert(invalidLoginCombination != null);
    assert(noInternet != null);
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result invalidLoginCombination(InvalidLoginCombination value),
    Result noInternet(NoInternet value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (noInternet != null) {
      return noInternet(this);
    }
    return orElse();
  }
}

abstract class NoInternet implements LoginFailure {
  const factory NoInternet() = _$NoInternet;
}
