// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'register_failure.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$RegisterFailure {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result emailAlreadyInUse(),
    @required Result usernameAlreadyInUse(),
    @required Result invalidRegisterCombination(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result emailAlreadyInUse(),
    Result usernameAlreadyInUse(),
    Result invalidRegisterCombination(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result emailAlreadyInUse(EmailAlreadyInUse value),
    @required Result usernameAlreadyInUse(UsernameAlreadyInUse value),
    @required
        Result invalidRegisterCombination(InvalidRegisterCombination value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result emailAlreadyInUse(EmailAlreadyInUse value),
    Result usernameAlreadyInUse(UsernameAlreadyInUse value),
    Result invalidRegisterCombination(InvalidRegisterCombination value),
    @required Result orElse(),
  });
}

class _$RegisterFailureTearOff {
  const _$RegisterFailureTearOff();

  ServerError serverError() {
    return const ServerError();
  }

  EmailAlreadyInUse emailAlreadyInUse() {
    return const EmailAlreadyInUse();
  }

  UsernameAlreadyInUse usernameAlreadyInUse() {
    return const UsernameAlreadyInUse();
  }

  InvalidRegisterCombination invalidRegisterCombination() {
    return const InvalidRegisterCombination();
  }
}

const $RegisterFailure = _$RegisterFailureTearOff();

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
    @required Result emailAlreadyInUse(),
    @required Result usernameAlreadyInUse(),
    @required Result invalidRegisterCombination(),
  }) {
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(usernameAlreadyInUse != null);
    assert(invalidRegisterCombination != null);
    return serverError();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result emailAlreadyInUse(),
    Result usernameAlreadyInUse(),
    Result invalidRegisterCombination(),
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
    @required Result emailAlreadyInUse(EmailAlreadyInUse value),
    @required Result usernameAlreadyInUse(UsernameAlreadyInUse value),
    @required
        Result invalidRegisterCombination(InvalidRegisterCombination value),
  }) {
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(usernameAlreadyInUse != null);
    assert(invalidRegisterCombination != null);
    return serverError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result emailAlreadyInUse(EmailAlreadyInUse value),
    Result usernameAlreadyInUse(UsernameAlreadyInUse value),
    Result invalidRegisterCombination(InvalidRegisterCombination value),
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

class _$EmailAlreadyInUse implements EmailAlreadyInUse {
  const _$EmailAlreadyInUse();

  @override
  String toString() {
    return 'RegisterFailure.emailAlreadyInUse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is EmailAlreadyInUse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result emailAlreadyInUse(),
    @required Result usernameAlreadyInUse(),
    @required Result invalidRegisterCombination(),
  }) {
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(usernameAlreadyInUse != null);
    assert(invalidRegisterCombination != null);
    return emailAlreadyInUse();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result emailAlreadyInUse(),
    Result usernameAlreadyInUse(),
    Result invalidRegisterCombination(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result emailAlreadyInUse(EmailAlreadyInUse value),
    @required Result usernameAlreadyInUse(UsernameAlreadyInUse value),
    @required
        Result invalidRegisterCombination(InvalidRegisterCombination value),
  }) {
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(usernameAlreadyInUse != null);
    assert(invalidRegisterCombination != null);
    return emailAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result emailAlreadyInUse(EmailAlreadyInUse value),
    Result usernameAlreadyInUse(UsernameAlreadyInUse value),
    Result invalidRegisterCombination(InvalidRegisterCombination value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailAlreadyInUse != null) {
      return emailAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class EmailAlreadyInUse implements RegisterFailure {
  const factory EmailAlreadyInUse() = _$EmailAlreadyInUse;
}

class _$UsernameAlreadyInUse implements UsernameAlreadyInUse {
  const _$UsernameAlreadyInUse();

  @override
  String toString() {
    return 'RegisterFailure.usernameAlreadyInUse()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UsernameAlreadyInUse);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result serverError(),
    @required Result emailAlreadyInUse(),
    @required Result usernameAlreadyInUse(),
    @required Result invalidRegisterCombination(),
  }) {
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(usernameAlreadyInUse != null);
    assert(invalidRegisterCombination != null);
    return usernameAlreadyInUse();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result emailAlreadyInUse(),
    Result usernameAlreadyInUse(),
    Result invalidRegisterCombination(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (usernameAlreadyInUse != null) {
      return usernameAlreadyInUse();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result serverError(ServerError value),
    @required Result emailAlreadyInUse(EmailAlreadyInUse value),
    @required Result usernameAlreadyInUse(UsernameAlreadyInUse value),
    @required
        Result invalidRegisterCombination(InvalidRegisterCombination value),
  }) {
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(usernameAlreadyInUse != null);
    assert(invalidRegisterCombination != null);
    return usernameAlreadyInUse(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result emailAlreadyInUse(EmailAlreadyInUse value),
    Result usernameAlreadyInUse(UsernameAlreadyInUse value),
    Result invalidRegisterCombination(InvalidRegisterCombination value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (usernameAlreadyInUse != null) {
      return usernameAlreadyInUse(this);
    }
    return orElse();
  }
}

abstract class UsernameAlreadyInUse implements RegisterFailure {
  const factory UsernameAlreadyInUse() = _$UsernameAlreadyInUse;
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
    @required Result emailAlreadyInUse(),
    @required Result usernameAlreadyInUse(),
    @required Result invalidRegisterCombination(),
  }) {
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(usernameAlreadyInUse != null);
    assert(invalidRegisterCombination != null);
    return invalidRegisterCombination();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result serverError(),
    Result emailAlreadyInUse(),
    Result usernameAlreadyInUse(),
    Result invalidRegisterCombination(),
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
    @required Result emailAlreadyInUse(EmailAlreadyInUse value),
    @required Result usernameAlreadyInUse(UsernameAlreadyInUse value),
    @required
        Result invalidRegisterCombination(InvalidRegisterCombination value),
  }) {
    assert(serverError != null);
    assert(emailAlreadyInUse != null);
    assert(usernameAlreadyInUse != null);
    assert(invalidRegisterCombination != null);
    return invalidRegisterCombination(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result serverError(ServerError value),
    Result emailAlreadyInUse(EmailAlreadyInUse value),
    Result usernameAlreadyInUse(UsernameAlreadyInUse value),
    Result invalidRegisterCombination(InvalidRegisterCombination value),
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
