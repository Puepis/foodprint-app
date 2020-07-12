// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'register_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$RegisterFormEventTearOff {
  const _$RegisterFormEventTearOff();

  UsernameChanged usernameChanged(String usernameStr) {
    return UsernameChanged(
      usernameStr,
    );
  }

  PasswordChanged passwordChanged(String passwordStr) {
    return PasswordChanged(
      passwordStr,
    );
  }

  ConfirmationPasswordChanged confirmationPasswordChanged(
      String confirmationStr) {
    return ConfirmationPasswordChanged(
      confirmationStr,
    );
  }

  RegisterPressed registerPressed() {
    return const RegisterPressed();
  }
}

// ignore: unused_element
const $RegisterFormEvent = _$RegisterFormEventTearOff();

mixin _$RegisterFormEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result usernameChanged(String usernameStr),
    @required Result passwordChanged(String passwordStr),
    @required Result confirmationPasswordChanged(String confirmationStr),
    @required Result registerPressed(),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result usernameChanged(String usernameStr),
    Result passwordChanged(String passwordStr),
    Result confirmationPasswordChanged(String confirmationStr),
    Result registerPressed(),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result usernameChanged(UsernameChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required
        Result confirmationPasswordChanged(ConfirmationPasswordChanged value),
    @required Result registerPressed(RegisterPressed value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result usernameChanged(UsernameChanged value),
    Result passwordChanged(PasswordChanged value),
    Result confirmationPasswordChanged(ConfirmationPasswordChanged value),
    Result registerPressed(RegisterPressed value),
    @required Result orElse(),
  });
}

abstract class $RegisterFormEventCopyWith<$Res> {
  factory $RegisterFormEventCopyWith(
          RegisterFormEvent value, $Res Function(RegisterFormEvent) then) =
      _$RegisterFormEventCopyWithImpl<$Res>;
}

class _$RegisterFormEventCopyWithImpl<$Res>
    implements $RegisterFormEventCopyWith<$Res> {
  _$RegisterFormEventCopyWithImpl(this._value, this._then);

  final RegisterFormEvent _value;
  // ignore: unused_field
  final $Res Function(RegisterFormEvent) _then;
}

abstract class $UsernameChangedCopyWith<$Res> {
  factory $UsernameChangedCopyWith(
          UsernameChanged value, $Res Function(UsernameChanged) then) =
      _$UsernameChangedCopyWithImpl<$Res>;
  $Res call({String usernameStr});
}

class _$UsernameChangedCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res>
    implements $UsernameChangedCopyWith<$Res> {
  _$UsernameChangedCopyWithImpl(
      UsernameChanged _value, $Res Function(UsernameChanged) _then)
      : super(_value, (v) => _then(v as UsernameChanged));

  @override
  UsernameChanged get _value => super._value as UsernameChanged;

  @override
  $Res call({
    Object usernameStr = freezed,
  }) {
    return _then(UsernameChanged(
      usernameStr == freezed ? _value.usernameStr : usernameStr as String,
    ));
  }
}

class _$UsernameChanged implements UsernameChanged {
  const _$UsernameChanged(this.usernameStr) : assert(usernameStr != null);

  @override
  final String usernameStr;

  @override
  String toString() {
    return 'RegisterFormEvent.usernameChanged(usernameStr: $usernameStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UsernameChanged &&
            (identical(other.usernameStr, usernameStr) ||
                const DeepCollectionEquality()
                    .equals(other.usernameStr, usernameStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(usernameStr);

  @override
  $UsernameChangedCopyWith<UsernameChanged> get copyWith =>
      _$UsernameChangedCopyWithImpl<UsernameChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result usernameChanged(String usernameStr),
    @required Result passwordChanged(String passwordStr),
    @required Result confirmationPasswordChanged(String confirmationStr),
    @required Result registerPressed(),
  }) {
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(confirmationPasswordChanged != null);
    assert(registerPressed != null);
    return usernameChanged(usernameStr);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result usernameChanged(String usernameStr),
    Result passwordChanged(String passwordStr),
    Result confirmationPasswordChanged(String confirmationStr),
    Result registerPressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (usernameChanged != null) {
      return usernameChanged(usernameStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result usernameChanged(UsernameChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required
        Result confirmationPasswordChanged(ConfirmationPasswordChanged value),
    @required Result registerPressed(RegisterPressed value),
  }) {
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(confirmationPasswordChanged != null);
    assert(registerPressed != null);
    return usernameChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result usernameChanged(UsernameChanged value),
    Result passwordChanged(PasswordChanged value),
    Result confirmationPasswordChanged(ConfirmationPasswordChanged value),
    Result registerPressed(RegisterPressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (usernameChanged != null) {
      return usernameChanged(this);
    }
    return orElse();
  }
}

abstract class UsernameChanged implements RegisterFormEvent {
  const factory UsernameChanged(String usernameStr) = _$UsernameChanged;

  String get usernameStr;
  $UsernameChangedCopyWith<UsernameChanged> get copyWith;
}

abstract class $PasswordChangedCopyWith<$Res> {
  factory $PasswordChangedCopyWith(
          PasswordChanged value, $Res Function(PasswordChanged) then) =
      _$PasswordChangedCopyWithImpl<$Res>;
  $Res call({String passwordStr});
}

class _$PasswordChangedCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res>
    implements $PasswordChangedCopyWith<$Res> {
  _$PasswordChangedCopyWithImpl(
      PasswordChanged _value, $Res Function(PasswordChanged) _then)
      : super(_value, (v) => _then(v as PasswordChanged));

  @override
  PasswordChanged get _value => super._value as PasswordChanged;

  @override
  $Res call({
    Object passwordStr = freezed,
  }) {
    return _then(PasswordChanged(
      passwordStr == freezed ? _value.passwordStr : passwordStr as String,
    ));
  }
}

class _$PasswordChanged implements PasswordChanged {
  const _$PasswordChanged(this.passwordStr) : assert(passwordStr != null);

  @override
  final String passwordStr;

  @override
  String toString() {
    return 'RegisterFormEvent.passwordChanged(passwordStr: $passwordStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordChanged &&
            (identical(other.passwordStr, passwordStr) ||
                const DeepCollectionEquality()
                    .equals(other.passwordStr, passwordStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(passwordStr);

  @override
  $PasswordChangedCopyWith<PasswordChanged> get copyWith =>
      _$PasswordChangedCopyWithImpl<PasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result usernameChanged(String usernameStr),
    @required Result passwordChanged(String passwordStr),
    @required Result confirmationPasswordChanged(String confirmationStr),
    @required Result registerPressed(),
  }) {
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(confirmationPasswordChanged != null);
    assert(registerPressed != null);
    return passwordChanged(passwordStr);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result usernameChanged(String usernameStr),
    Result passwordChanged(String passwordStr),
    Result confirmationPasswordChanged(String confirmationStr),
    Result registerPressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(passwordStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result usernameChanged(UsernameChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required
        Result confirmationPasswordChanged(ConfirmationPasswordChanged value),
    @required Result registerPressed(RegisterPressed value),
  }) {
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(confirmationPasswordChanged != null);
    assert(registerPressed != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result usernameChanged(UsernameChanged value),
    Result passwordChanged(PasswordChanged value),
    Result confirmationPasswordChanged(ConfirmationPasswordChanged value),
    Result registerPressed(RegisterPressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class PasswordChanged implements RegisterFormEvent {
  const factory PasswordChanged(String passwordStr) = _$PasswordChanged;

  String get passwordStr;
  $PasswordChangedCopyWith<PasswordChanged> get copyWith;
}

abstract class $ConfirmationPasswordChangedCopyWith<$Res> {
  factory $ConfirmationPasswordChangedCopyWith(
          ConfirmationPasswordChanged value,
          $Res Function(ConfirmationPasswordChanged) then) =
      _$ConfirmationPasswordChangedCopyWithImpl<$Res>;
  $Res call({String confirmationStr});
}

class _$ConfirmationPasswordChangedCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res>
    implements $ConfirmationPasswordChangedCopyWith<$Res> {
  _$ConfirmationPasswordChangedCopyWithImpl(ConfirmationPasswordChanged _value,
      $Res Function(ConfirmationPasswordChanged) _then)
      : super(_value, (v) => _then(v as ConfirmationPasswordChanged));

  @override
  ConfirmationPasswordChanged get _value =>
      super._value as ConfirmationPasswordChanged;

  @override
  $Res call({
    Object confirmationStr = freezed,
  }) {
    return _then(ConfirmationPasswordChanged(
      confirmationStr == freezed
          ? _value.confirmationStr
          : confirmationStr as String,
    ));
  }
}

class _$ConfirmationPasswordChanged implements ConfirmationPasswordChanged {
  const _$ConfirmationPasswordChanged(this.confirmationStr)
      : assert(confirmationStr != null);

  @override
  final String confirmationStr;

  @override
  String toString() {
    return 'RegisterFormEvent.confirmationPasswordChanged(confirmationStr: $confirmationStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is ConfirmationPasswordChanged &&
            (identical(other.confirmationStr, confirmationStr) ||
                const DeepCollectionEquality()
                    .equals(other.confirmationStr, confirmationStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(confirmationStr);

  @override
  $ConfirmationPasswordChangedCopyWith<ConfirmationPasswordChanged>
      get copyWith => _$ConfirmationPasswordChangedCopyWithImpl<
          ConfirmationPasswordChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result usernameChanged(String usernameStr),
    @required Result passwordChanged(String passwordStr),
    @required Result confirmationPasswordChanged(String confirmationStr),
    @required Result registerPressed(),
  }) {
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(confirmationPasswordChanged != null);
    assert(registerPressed != null);
    return confirmationPasswordChanged(confirmationStr);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result usernameChanged(String usernameStr),
    Result passwordChanged(String passwordStr),
    Result confirmationPasswordChanged(String confirmationStr),
    Result registerPressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (confirmationPasswordChanged != null) {
      return confirmationPasswordChanged(confirmationStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result usernameChanged(UsernameChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required
        Result confirmationPasswordChanged(ConfirmationPasswordChanged value),
    @required Result registerPressed(RegisterPressed value),
  }) {
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(confirmationPasswordChanged != null);
    assert(registerPressed != null);
    return confirmationPasswordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result usernameChanged(UsernameChanged value),
    Result passwordChanged(PasswordChanged value),
    Result confirmationPasswordChanged(ConfirmationPasswordChanged value),
    Result registerPressed(RegisterPressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (confirmationPasswordChanged != null) {
      return confirmationPasswordChanged(this);
    }
    return orElse();
  }
}

abstract class ConfirmationPasswordChanged implements RegisterFormEvent {
  const factory ConfirmationPasswordChanged(String confirmationStr) =
      _$ConfirmationPasswordChanged;

  String get confirmationStr;
  $ConfirmationPasswordChangedCopyWith<ConfirmationPasswordChanged>
      get copyWith;
}

abstract class $RegisterPressedCopyWith<$Res> {
  factory $RegisterPressedCopyWith(
          RegisterPressed value, $Res Function(RegisterPressed) then) =
      _$RegisterPressedCopyWithImpl<$Res>;
}

class _$RegisterPressedCopyWithImpl<$Res>
    extends _$RegisterFormEventCopyWithImpl<$Res>
    implements $RegisterPressedCopyWith<$Res> {
  _$RegisterPressedCopyWithImpl(
      RegisterPressed _value, $Res Function(RegisterPressed) _then)
      : super(_value, (v) => _then(v as RegisterPressed));

  @override
  RegisterPressed get _value => super._value as RegisterPressed;
}

class _$RegisterPressed implements RegisterPressed {
  const _$RegisterPressed();

  @override
  String toString() {
    return 'RegisterFormEvent.registerPressed()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is RegisterPressed);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result usernameChanged(String usernameStr),
    @required Result passwordChanged(String passwordStr),
    @required Result confirmationPasswordChanged(String confirmationStr),
    @required Result registerPressed(),
  }) {
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(confirmationPasswordChanged != null);
    assert(registerPressed != null);
    return registerPressed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result usernameChanged(String usernameStr),
    Result passwordChanged(String passwordStr),
    Result confirmationPasswordChanged(String confirmationStr),
    Result registerPressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerPressed != null) {
      return registerPressed();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result usernameChanged(UsernameChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required
        Result confirmationPasswordChanged(ConfirmationPasswordChanged value),
    @required Result registerPressed(RegisterPressed value),
  }) {
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(confirmationPasswordChanged != null);
    assert(registerPressed != null);
    return registerPressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result usernameChanged(UsernameChanged value),
    Result passwordChanged(PasswordChanged value),
    Result confirmationPasswordChanged(ConfirmationPasswordChanged value),
    Result registerPressed(RegisterPressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (registerPressed != null) {
      return registerPressed(this);
    }
    return orElse();
  }
}

abstract class RegisterPressed implements RegisterFormEvent {
  const factory RegisterPressed() = _$RegisterPressed;
}

class _$RegisterFormStateTearOff {
  const _$RegisterFormStateTearOff();

  _RegisterFormState call(
      {@required
          Username username,
      @required
          Password password,
      @required
          ConfirmationPassword confirmationPassword,
      @required
          bool passwordsMatch,
      @required
          bool showErrorMessages,
      @required
          bool isSubmitting,
      @required
          Option<Either<RegisterFailure, Unit>> authFailureOrSuccessOption}) {
    return _RegisterFormState(
      username: username,
      password: password,
      confirmationPassword: confirmationPassword,
      passwordsMatch: passwordsMatch,
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

// ignore: unused_element
const $RegisterFormState = _$RegisterFormStateTearOff();

mixin _$RegisterFormState {
  Username get username;
  Password get password;
  ConfirmationPassword get confirmationPassword;
  bool get passwordsMatch;
  bool get showErrorMessages;
  bool get isSubmitting;
  Option<Either<RegisterFailure, Unit>> get authFailureOrSuccessOption;

  $RegisterFormStateCopyWith<RegisterFormState> get copyWith;
}

abstract class $RegisterFormStateCopyWith<$Res> {
  factory $RegisterFormStateCopyWith(
          RegisterFormState value, $Res Function(RegisterFormState) then) =
      _$RegisterFormStateCopyWithImpl<$Res>;
  $Res call(
      {Username username,
      Password password,
      ConfirmationPassword confirmationPassword,
      bool passwordsMatch,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<RegisterFailure, Unit>> authFailureOrSuccessOption});
}

class _$RegisterFormStateCopyWithImpl<$Res>
    implements $RegisterFormStateCopyWith<$Res> {
  _$RegisterFormStateCopyWithImpl(this._value, this._then);

  final RegisterFormState _value;
  // ignore: unused_field
  final $Res Function(RegisterFormState) _then;

  @override
  $Res call({
    Object username = freezed,
    Object password = freezed,
    Object confirmationPassword = freezed,
    Object passwordsMatch = freezed,
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object authFailureOrSuccessOption = freezed,
  }) {
    return _then(_value.copyWith(
      username: username == freezed ? _value.username : username as Username,
      password: password == freezed ? _value.password : password as Password,
      confirmationPassword: confirmationPassword == freezed
          ? _value.confirmationPassword
          : confirmationPassword as ConfirmationPassword,
      passwordsMatch: passwordsMatch == freezed
          ? _value.passwordsMatch
          : passwordsMatch as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption as Option<Either<RegisterFailure, Unit>>,
    ));
  }
}

abstract class _$RegisterFormStateCopyWith<$Res>
    implements $RegisterFormStateCopyWith<$Res> {
  factory _$RegisterFormStateCopyWith(
          _RegisterFormState value, $Res Function(_RegisterFormState) then) =
      __$RegisterFormStateCopyWithImpl<$Res>;
  @override
  $Res call(
      {Username username,
      Password password,
      ConfirmationPassword confirmationPassword,
      bool passwordsMatch,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<RegisterFailure, Unit>> authFailureOrSuccessOption});
}

class __$RegisterFormStateCopyWithImpl<$Res>
    extends _$RegisterFormStateCopyWithImpl<$Res>
    implements _$RegisterFormStateCopyWith<$Res> {
  __$RegisterFormStateCopyWithImpl(
      _RegisterFormState _value, $Res Function(_RegisterFormState) _then)
      : super(_value, (v) => _then(v as _RegisterFormState));

  @override
  _RegisterFormState get _value => super._value as _RegisterFormState;

  @override
  $Res call({
    Object username = freezed,
    Object password = freezed,
    Object confirmationPassword = freezed,
    Object passwordsMatch = freezed,
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object authFailureOrSuccessOption = freezed,
  }) {
    return _then(_RegisterFormState(
      username: username == freezed ? _value.username : username as Username,
      password: password == freezed ? _value.password : password as Password,
      confirmationPassword: confirmationPassword == freezed
          ? _value.confirmationPassword
          : confirmationPassword as ConfirmationPassword,
      passwordsMatch: passwordsMatch == freezed
          ? _value.passwordsMatch
          : passwordsMatch as bool,
      showErrorMessages: showErrorMessages == freezed
          ? _value.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? _value.isSubmitting : isSubmitting as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? _value.authFailureOrSuccessOption
          : authFailureOrSuccessOption as Option<Either<RegisterFailure, Unit>>,
    ));
  }
}

class _$_RegisterFormState implements _RegisterFormState {
  const _$_RegisterFormState(
      {@required this.username,
      @required this.password,
      @required this.confirmationPassword,
      @required this.passwordsMatch,
      @required this.showErrorMessages,
      @required this.isSubmitting,
      @required this.authFailureOrSuccessOption})
      : assert(username != null),
        assert(password != null),
        assert(confirmationPassword != null),
        assert(passwordsMatch != null),
        assert(showErrorMessages != null),
        assert(isSubmitting != null),
        assert(authFailureOrSuccessOption != null);

  @override
  final Username username;
  @override
  final Password password;
  @override
  final ConfirmationPassword confirmationPassword;
  @override
  final bool passwordsMatch;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<RegisterFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'RegisterFormState(username: $username, password: $password, confirmationPassword: $confirmationPassword, passwordsMatch: $passwordsMatch, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegisterFormState &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
            (identical(other.confirmationPassword, confirmationPassword) ||
                const DeepCollectionEquality().equals(
                    other.confirmationPassword, confirmationPassword)) &&
            (identical(other.passwordsMatch, passwordsMatch) ||
                const DeepCollectionEquality()
                    .equals(other.passwordsMatch, passwordsMatch)) &&
            (identical(other.showErrorMessages, showErrorMessages) ||
                const DeepCollectionEquality()
                    .equals(other.showErrorMessages, showErrorMessages)) &&
            (identical(other.isSubmitting, isSubmitting) ||
                const DeepCollectionEquality()
                    .equals(other.isSubmitting, isSubmitting)) &&
            (identical(other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption) ||
                const DeepCollectionEquality().equals(
                    other.authFailureOrSuccessOption,
                    authFailureOrSuccessOption)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(confirmationPassword) ^
      const DeepCollectionEquality().hash(passwordsMatch) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption);

  @override
  _$RegisterFormStateCopyWith<_RegisterFormState> get copyWith =>
      __$RegisterFormStateCopyWithImpl<_RegisterFormState>(this, _$identity);
}

abstract class _RegisterFormState implements RegisterFormState {
  const factory _RegisterFormState(
      {@required
          Username username,
      @required
          Password password,
      @required
          ConfirmationPassword confirmationPassword,
      @required
          bool passwordsMatch,
      @required
          bool showErrorMessages,
      @required
          bool isSubmitting,
      @required
          Option<Either<RegisterFailure, Unit>>
              authFailureOrSuccessOption}) = _$_RegisterFormState;

  @override
  Username get username;
  @override
  Password get password;
  @override
  ConfirmationPassword get confirmationPassword;
  @override
  bool get passwordsMatch;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<RegisterFailure, Unit>> get authFailureOrSuccessOption;
  @override
  _$RegisterFormStateCopyWith<_RegisterFormState> get copyWith;
}
