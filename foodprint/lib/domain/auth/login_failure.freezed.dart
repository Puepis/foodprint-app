// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'login_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

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

class _$LoginFailureTearOff {
  const _$LoginFailureTearOff();

  ServerError serverError() {
    return const ServerError();
  }

  InvalidLoginCombination invalidLoginCombination() {
    return const InvalidLoginCombination();
  }
}

const $LoginFailure = _$LoginFailureTearOff();

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
