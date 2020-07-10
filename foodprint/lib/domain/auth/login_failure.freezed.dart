// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'login_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

class _$LoginFailureTearOff {
  const _$LoginFailureTearOff();

  ServerError serverError() {
    return const ServerError();
  }

  InvalidLoginCombination invalidLoginCombination() {
    return const InvalidLoginCombination();
  }
}

// ignore: unused_element
const $LoginFailure = _$LoginFailureTearOff();

mixin _$LoginFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result invalidLoginCombination(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result invalidLoginCombination(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result invalidLoginCombination(InvalidLoginCombination value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result invalidLoginCombination(InvalidLoginCombination value),
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
  }) {
    assert(serverError != null);
    assert(invalidLoginCombination != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result invalidLoginCombination(),
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
  }) {
    assert(serverError != null);
    assert(invalidLoginCombination != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result invalidLoginCombination(InvalidLoginCombination value),
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
  }) {
    assert(serverError != null);
    assert(invalidLoginCombination != null);
    return invalidLoginCombination();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result invalidLoginCombination(),
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
  }) {
    assert(serverError != null);
    assert(invalidLoginCombination != null);
    return invalidLoginCombination(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result invalidLoginCombination(InvalidLoginCombination value),
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
