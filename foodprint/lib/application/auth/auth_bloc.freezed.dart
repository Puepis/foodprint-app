// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'auth_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AuthEventTearOff {
  const _$AuthEventTearOff();

  AuthCheckStarted authCheckStarted() {
    return const AuthCheckStarted();
  }

  LoggedIn loggedIn({@required JWT token}) {
    return LoggedIn(
      token: token,
    );
  }

  LoggedOut loggedOut(JWT token) {
    return LoggedOut(
      token,
    );
  }
}

// ignore: unused_element
const $AuthEvent = _$AuthEventTearOff();

mixin _$AuthEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authCheckStarted(),
    @required Result loggedIn(JWT token),
    @required Result loggedOut(JWT token),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authCheckStarted(),
    Result loggedIn(JWT token),
    Result loggedOut(JWT token),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authCheckStarted(AuthCheckStarted value),
    @required Result loggedIn(LoggedIn value),
    @required Result loggedOut(LoggedOut value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authCheckStarted(AuthCheckStarted value),
    Result loggedIn(LoggedIn value),
    Result loggedOut(LoggedOut value),
    @required Result orElse(),
  });
}

abstract class $AuthEventCopyWith<$Res> {
  factory $AuthEventCopyWith(AuthEvent value, $Res Function(AuthEvent) then) =
      _$AuthEventCopyWithImpl<$Res>;
}

class _$AuthEventCopyWithImpl<$Res> implements $AuthEventCopyWith<$Res> {
  _$AuthEventCopyWithImpl(this._value, this._then);

  final AuthEvent _value;
  // ignore: unused_field
  final $Res Function(AuthEvent) _then;
}

abstract class $AuthCheckStartedCopyWith<$Res> {
  factory $AuthCheckStartedCopyWith(
          AuthCheckStarted value, $Res Function(AuthCheckStarted) then) =
      _$AuthCheckStartedCopyWithImpl<$Res>;
}

class _$AuthCheckStartedCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $AuthCheckStartedCopyWith<$Res> {
  _$AuthCheckStartedCopyWithImpl(
      AuthCheckStarted _value, $Res Function(AuthCheckStarted) _then)
      : super(_value, (v) => _then(v as AuthCheckStarted));

  @override
  AuthCheckStarted get _value => super._value as AuthCheckStarted;
}

class _$AuthCheckStarted implements AuthCheckStarted {
  const _$AuthCheckStarted();

  @override
  String toString() {
    return 'AuthEvent.authCheckStarted()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AuthCheckStarted);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authCheckStarted(),
    @required Result loggedIn(JWT token),
    @required Result loggedOut(JWT token),
  }) {
    assert(authCheckStarted != null);
    assert(loggedIn != null);
    assert(loggedOut != null);
    return authCheckStarted();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authCheckStarted(),
    Result loggedIn(JWT token),
    Result loggedOut(JWT token),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authCheckStarted != null) {
      return authCheckStarted();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authCheckStarted(AuthCheckStarted value),
    @required Result loggedIn(LoggedIn value),
    @required Result loggedOut(LoggedOut value),
  }) {
    assert(authCheckStarted != null);
    assert(loggedIn != null);
    assert(loggedOut != null);
    return authCheckStarted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authCheckStarted(AuthCheckStarted value),
    Result loggedIn(LoggedIn value),
    Result loggedOut(LoggedOut value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authCheckStarted != null) {
      return authCheckStarted(this);
    }
    return orElse();
  }
}

abstract class AuthCheckStarted implements AuthEvent {
  const factory AuthCheckStarted() = _$AuthCheckStarted;
}

abstract class $LoggedInCopyWith<$Res> {
  factory $LoggedInCopyWith(LoggedIn value, $Res Function(LoggedIn) then) =
      _$LoggedInCopyWithImpl<$Res>;
  $Res call({JWT token});
}

class _$LoggedInCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $LoggedInCopyWith<$Res> {
  _$LoggedInCopyWithImpl(LoggedIn _value, $Res Function(LoggedIn) _then)
      : super(_value, (v) => _then(v as LoggedIn));

  @override
  LoggedIn get _value => super._value as LoggedIn;

  @override
  $Res call({
    Object token = freezed,
  }) {
    return _then(LoggedIn(
      token: token == freezed ? _value.token : token as JWT,
    ));
  }
}

class _$LoggedIn implements LoggedIn {
  const _$LoggedIn({@required this.token}) : assert(token != null);

  @override
  final JWT token;

  @override
  String toString() {
    return 'AuthEvent.loggedIn(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoggedIn &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(token);

  @override
  $LoggedInCopyWith<LoggedIn> get copyWith =>
      _$LoggedInCopyWithImpl<LoggedIn>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authCheckStarted(),
    @required Result loggedIn(JWT token),
    @required Result loggedOut(JWT token),
  }) {
    assert(authCheckStarted != null);
    assert(loggedIn != null);
    assert(loggedOut != null);
    return loggedIn(token);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authCheckStarted(),
    Result loggedIn(JWT token),
    Result loggedOut(JWT token),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loggedIn != null) {
      return loggedIn(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authCheckStarted(AuthCheckStarted value),
    @required Result loggedIn(LoggedIn value),
    @required Result loggedOut(LoggedOut value),
  }) {
    assert(authCheckStarted != null);
    assert(loggedIn != null);
    assert(loggedOut != null);
    return loggedIn(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authCheckStarted(AuthCheckStarted value),
    Result loggedIn(LoggedIn value),
    Result loggedOut(LoggedOut value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loggedIn != null) {
      return loggedIn(this);
    }
    return orElse();
  }
}

abstract class LoggedIn implements AuthEvent {
  const factory LoggedIn({@required JWT token}) = _$LoggedIn;

  JWT get token;
  $LoggedInCopyWith<LoggedIn> get copyWith;
}

abstract class $LoggedOutCopyWith<$Res> {
  factory $LoggedOutCopyWith(LoggedOut value, $Res Function(LoggedOut) then) =
      _$LoggedOutCopyWithImpl<$Res>;
  $Res call({JWT token});
}

class _$LoggedOutCopyWithImpl<$Res> extends _$AuthEventCopyWithImpl<$Res>
    implements $LoggedOutCopyWith<$Res> {
  _$LoggedOutCopyWithImpl(LoggedOut _value, $Res Function(LoggedOut) _then)
      : super(_value, (v) => _then(v as LoggedOut));

  @override
  LoggedOut get _value => super._value as LoggedOut;

  @override
  $Res call({
    Object token = freezed,
  }) {
    return _then(LoggedOut(
      token == freezed ? _value.token : token as JWT,
    ));
  }
}

class _$LoggedOut implements LoggedOut {
  const _$LoggedOut(this.token) : assert(token != null);

  @override
  final JWT token;

  @override
  String toString() {
    return 'AuthEvent.loggedOut(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is LoggedOut &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(token);

  @override
  $LoggedOutCopyWith<LoggedOut> get copyWith =>
      _$LoggedOutCopyWithImpl<LoggedOut>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result authCheckStarted(),
    @required Result loggedIn(JWT token),
    @required Result loggedOut(JWT token),
  }) {
    assert(authCheckStarted != null);
    assert(loggedIn != null);
    assert(loggedOut != null);
    return loggedOut(token);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result authCheckStarted(),
    Result loggedIn(JWT token),
    Result loggedOut(JWT token),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loggedOut != null) {
      return loggedOut(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result authCheckStarted(AuthCheckStarted value),
    @required Result loggedIn(LoggedIn value),
    @required Result loggedOut(LoggedOut value),
  }) {
    assert(authCheckStarted != null);
    assert(loggedIn != null);
    assert(loggedOut != null);
    return loggedOut(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result authCheckStarted(AuthCheckStarted value),
    Result loggedIn(LoggedIn value),
    Result loggedOut(LoggedOut value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (loggedOut != null) {
      return loggedOut(this);
    }
    return orElse();
  }
}

abstract class LoggedOut implements AuthEvent {
  const factory LoggedOut(JWT token) = _$LoggedOut;

  JWT get token;
  $LoggedOutCopyWith<LoggedOut> get copyWith;
}

class _$AuthStateTearOff {
  const _$AuthStateTearOff();

  Initial initial() {
    return const Initial();
  }

  Authenticated authenticated({@required JWT token}) {
    return Authenticated(
      token: token,
    );
  }

  Unauthenticated unauthenticated() {
    return const Unauthenticated();
  }
}

// ignore: unused_element
const $AuthState = _$AuthStateTearOff();

mixin _$AuthState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(JWT token),
    @required Result unauthenticated(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(JWT token),
    Result unauthenticated(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    @required Result orElse(),
  });
}

abstract class $AuthStateCopyWith<$Res> {
  factory $AuthStateCopyWith(AuthState value, $Res Function(AuthState) then) =
      _$AuthStateCopyWithImpl<$Res>;
}

class _$AuthStateCopyWithImpl<$Res> implements $AuthStateCopyWith<$Res> {
  _$AuthStateCopyWithImpl(this._value, this._then);

  final AuthState _value;
  // ignore: unused_field
  final $Res Function(AuthState) _then;
}

abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

class _$InitialCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
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
    return 'AuthState.initial()';
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
    @required Result authenticated(JWT token),
    @required Result unauthenticated(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(JWT token),
    Result unauthenticated(),
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
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AuthState {
  const factory Initial() = _$Initial;
}

abstract class $AuthenticatedCopyWith<$Res> {
  factory $AuthenticatedCopyWith(
          Authenticated value, $Res Function(Authenticated) then) =
      _$AuthenticatedCopyWithImpl<$Res>;
  $Res call({JWT token});
}

class _$AuthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(
      Authenticated _value, $Res Function(Authenticated) _then)
      : super(_value, (v) => _then(v as Authenticated));

  @override
  Authenticated get _value => super._value as Authenticated;

  @override
  $Res call({
    Object token = freezed,
  }) {
    return _then(Authenticated(
      token: token == freezed ? _value.token : token as JWT,
    ));
  }
}

class _$Authenticated implements Authenticated {
  const _$Authenticated({@required this.token}) : assert(token != null);

  @override
  final JWT token;

  @override
  String toString() {
    return 'AuthState.authenticated(token: $token)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Authenticated &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(token);

  @override
  $AuthenticatedCopyWith<Authenticated> get copyWith =>
      _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(JWT token),
    @required Result unauthenticated(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return authenticated(token);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(JWT token),
    Result unauthenticated(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthState {
  const factory Authenticated({@required JWT token}) = _$Authenticated;

  JWT get token;
  $AuthenticatedCopyWith<Authenticated> get copyWith;
}

abstract class $UnauthenticatedCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(
          Unauthenticated value, $Res Function(Unauthenticated) then) =
      _$UnauthenticatedCopyWithImpl<$Res>;
}

class _$UnauthenticatedCopyWithImpl<$Res> extends _$AuthStateCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(
      Unauthenticated _value, $Res Function(Unauthenticated) _then)
      : super(_value, (v) => _then(v as Unauthenticated));

  @override
  Unauthenticated get _value => super._value as Unauthenticated;
}

class _$Unauthenticated implements Unauthenticated {
  const _$Unauthenticated();

  @override
  String toString() {
    return 'AuthState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result authenticated(JWT token),
    @required Result unauthenticated(),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result authenticated(JWT token),
    Result unauthenticated(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result authenticated(Authenticated value),
    @required Result unauthenticated(Unauthenticated value),
  }) {
    assert(initial != null);
    assert(authenticated != null);
    assert(unauthenticated != null);
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result authenticated(Authenticated value),
    Result unauthenticated(Unauthenticated value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthState {
  const factory Unauthenticated() = _$Unauthenticated;
}
