// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'register_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RegisterFailureTearOff {
  const _$RegisterFailureTearOff();

  ServerError serverError() {
    return const ServerError();
  }

  UserAlreadyExists userAlreadyExists() {
    return const UserAlreadyExists();
  }

  InvalidRegisterCombination invalidRegisterCombination() {
    return const InvalidRegisterCombination();
  }

  NoInternet noInternet() {
    return const NoInternet();
  }
}

// ignore: unused_element
const $RegisterFailure = _$RegisterFailureTearOff();

mixin _$RegisterFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result userAlreadyExists(),
    @required Result invalidRegisterCombination(),
    @required Result noInternet(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result userAlreadyExists(),
    Result invalidRegisterCombination(),
    Result noInternet(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result userAlreadyExists(UserAlreadyExists value),
    @required
        Result invalidRegisterCombination(InvalidRegisterCombination value),
    @required Result noInternet(NoInternet value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result userAlreadyExists(UserAlreadyExists value),
    Result invalidRegisterCombination(InvalidRegisterCombination value),
    Result noInternet(NoInternet value),
    @required Result orElse(),
  });
}

abstract class $RegisterFailureCopyWith<$Res> {
  factory $RegisterFailureCopyWith(
          RegisterFailure value, $Res Function(RegisterFailure) then) =
      _$RegisterFailureCopyWithImpl<$Res>;
}

class _$RegisterFailureCopyWithImpl<$Res>
    implements $RegisterFailureCopyWith<$Res> {
  _$RegisterFailureCopyWithImpl(this._value, this._then);

  final RegisterFailure _value;
  // ignore: unused_field
  final $Res Function(RegisterFailure) _then;
}

abstract class $ServerErrorCopyWith<$Res> {
  factory $ServerErrorCopyWith(
          ServerError value, $Res Function(ServerError) then) =
      _$ServerErrorCopyWithImpl<$Res>;
}

class _$ServerErrorCopyWithImpl<$Res>
    extends _$RegisterFailureCopyWithImpl<$Res>
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
    return 'RegisterFailure.serverError()';
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
    @required Result userAlreadyExists(),
    @required Result invalidRegisterCombination(),
    @required Result noInternet(),
  }) {
    assert(serverError != null);
    assert(userAlreadyExists != null);
    assert(invalidRegisterCombination != null);
    assert(noInternet != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result userAlreadyExists(),
    Result invalidRegisterCombination(),
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
    @required Result userAlreadyExists(UserAlreadyExists value),
    @required
        Result invalidRegisterCombination(InvalidRegisterCombination value),
    @required Result noInternet(NoInternet value),
  }) {
    assert(serverError != null);
    assert(userAlreadyExists != null);
    assert(invalidRegisterCombination != null);
    assert(noInternet != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result userAlreadyExists(UserAlreadyExists value),
    Result invalidRegisterCombination(InvalidRegisterCombination value),
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

abstract class ServerError implements RegisterFailure {
  const factory ServerError() = _$ServerError;
}

abstract class $UserAlreadyExistsCopyWith<$Res> {
  factory $UserAlreadyExistsCopyWith(
          UserAlreadyExists value, $Res Function(UserAlreadyExists) then) =
      _$UserAlreadyExistsCopyWithImpl<$Res>;
}

class _$UserAlreadyExistsCopyWithImpl<$Res>
    extends _$RegisterFailureCopyWithImpl<$Res>
    implements $UserAlreadyExistsCopyWith<$Res> {
  _$UserAlreadyExistsCopyWithImpl(
      UserAlreadyExists _value, $Res Function(UserAlreadyExists) _then)
      : super(_value, (v) => _then(v as UserAlreadyExists));

  @override
  UserAlreadyExists get _value => super._value as UserAlreadyExists;
}

class _$UserAlreadyExists implements UserAlreadyExists {
  const _$UserAlreadyExists();

  @override
  String toString() {
    return 'RegisterFailure.userAlreadyExists()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UserAlreadyExists);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result userAlreadyExists(),
    @required Result invalidRegisterCombination(),
    @required Result noInternet(),
  }) {
    assert(serverError != null);
    assert(userAlreadyExists != null);
    assert(invalidRegisterCombination != null);
    assert(noInternet != null);
    return userAlreadyExists();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result userAlreadyExists(),
    Result invalidRegisterCombination(),
    Result noInternet(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userAlreadyExists != null) {
      return userAlreadyExists();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result userAlreadyExists(UserAlreadyExists value),
    @required
        Result invalidRegisterCombination(InvalidRegisterCombination value),
    @required Result noInternet(NoInternet value),
  }) {
    assert(serverError != null);
    assert(userAlreadyExists != null);
    assert(invalidRegisterCombination != null);
    assert(noInternet != null);
    return userAlreadyExists(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result userAlreadyExists(UserAlreadyExists value),
    Result invalidRegisterCombination(InvalidRegisterCombination value),
    Result noInternet(NoInternet value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (userAlreadyExists != null) {
      return userAlreadyExists(this);
    }
    return orElse();
  }
}

abstract class UserAlreadyExists implements RegisterFailure {
  const factory UserAlreadyExists() = _$UserAlreadyExists;
}

abstract class $InvalidRegisterCombinationCopyWith<$Res> {
  factory $InvalidRegisterCombinationCopyWith(InvalidRegisterCombination value,
          $Res Function(InvalidRegisterCombination) then) =
      _$InvalidRegisterCombinationCopyWithImpl<$Res>;
}

class _$InvalidRegisterCombinationCopyWithImpl<$Res>
    extends _$RegisterFailureCopyWithImpl<$Res>
    implements $InvalidRegisterCombinationCopyWith<$Res> {
  _$InvalidRegisterCombinationCopyWithImpl(InvalidRegisterCombination _value,
      $Res Function(InvalidRegisterCombination) _then)
      : super(_value, (v) => _then(v as InvalidRegisterCombination));

  @override
  InvalidRegisterCombination get _value =>
      super._value as InvalidRegisterCombination;
}

class _$InvalidRegisterCombination implements InvalidRegisterCombination {
  const _$InvalidRegisterCombination();

  @override
  String toString() {
    return 'RegisterFailure.invalidRegisterCombination()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is InvalidRegisterCombination);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result userAlreadyExists(),
    @required Result invalidRegisterCombination(),
    @required Result noInternet(),
  }) {
    assert(serverError != null);
    assert(userAlreadyExists != null);
    assert(invalidRegisterCombination != null);
    assert(noInternet != null);
    return invalidRegisterCombination();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result userAlreadyExists(),
    Result invalidRegisterCombination(),
    Result noInternet(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidRegisterCombination != null) {
      return invalidRegisterCombination();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result userAlreadyExists(UserAlreadyExists value),
    @required
        Result invalidRegisterCombination(InvalidRegisterCombination value),
    @required Result noInternet(NoInternet value),
  }) {
    assert(serverError != null);
    assert(userAlreadyExists != null);
    assert(invalidRegisterCombination != null);
    assert(noInternet != null);
    return invalidRegisterCombination(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result userAlreadyExists(UserAlreadyExists value),
    Result invalidRegisterCombination(InvalidRegisterCombination value),
    Result noInternet(NoInternet value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (invalidRegisterCombination != null) {
      return invalidRegisterCombination(this);
    }
    return orElse();
  }
}

abstract class InvalidRegisterCombination implements RegisterFailure {
  const factory InvalidRegisterCombination() = _$InvalidRegisterCombination;
}

abstract class $NoInternetCopyWith<$Res> {
  factory $NoInternetCopyWith(
          NoInternet value, $Res Function(NoInternet) then) =
      _$NoInternetCopyWithImpl<$Res>;
}

class _$NoInternetCopyWithImpl<$Res> extends _$RegisterFailureCopyWithImpl<$Res>
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
    return 'RegisterFailure.noInternet()';
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
    @required Result userAlreadyExists(),
    @required Result invalidRegisterCombination(),
    @required Result noInternet(),
  }) {
    assert(serverError != null);
    assert(userAlreadyExists != null);
    assert(invalidRegisterCombination != null);
    assert(noInternet != null);
    return noInternet();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result userAlreadyExists(),
    Result invalidRegisterCombination(),
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
    @required Result userAlreadyExists(UserAlreadyExists value),
    @required
        Result invalidRegisterCombination(InvalidRegisterCombination value),
    @required Result noInternet(NoInternet value),
  }) {
    assert(serverError != null);
    assert(userAlreadyExists != null);
    assert(invalidRegisterCombination != null);
    assert(noInternet != null);
    return noInternet(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result userAlreadyExists(UserAlreadyExists value),
    Result invalidRegisterCombination(InvalidRegisterCombination value),
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

abstract class NoInternet implements RegisterFailure {
  const factory NoInternet() = _$NoInternet;
}
