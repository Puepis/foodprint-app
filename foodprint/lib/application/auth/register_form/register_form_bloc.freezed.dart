// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'register_form_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

mixin _$RegisterFormEvent {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String emailStr),
    @required Result usernameChanged(String usernameStr),
    @required Result passwordChanged(String passwordStr),
    @required Result registerPressed(),
  });

  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String emailStr),
    Result usernameChanged(String usernameStr),
    Result passwordChanged(String passwordStr),
    Result registerPressed(),
    @required Result orElse(),
  });

  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result usernameChanged(UsernameChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result registerPressed(RegisterPressed value),
  });

  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result usernameChanged(UsernameChanged value),
    Result passwordChanged(PasswordChanged value),
    Result registerPressed(RegisterPressed value),
    @required Result orElse(),
  });
}

class _$RegisterFormEventTearOff {
  const _$RegisterFormEventTearOff();

  EmailChanged emailChanged(String emailStr) {
    return EmailChanged(
      emailStr,
    );
  }

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

  RegisterPressed registerPressed() {
    return const RegisterPressed();
  }
}

const $RegisterFormEvent = _$RegisterFormEventTearOff();

class _$EmailChanged implements EmailChanged {
  const _$EmailChanged(this.emailStr) : assert(emailStr != null);

  @override
  final String emailStr;

  @override
  String toString() {
    return 'RegisterFormEvent.emailChanged(emailStr: $emailStr)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is EmailChanged &&
            (identical(other.emailStr, emailStr) ||
                const DeepCollectionEquality()
                    .equals(other.emailStr, emailStr)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(emailStr);

  @override
  _$EmailChanged copyWith({
    Object emailStr = freezed,
  }) {
    return _$EmailChanged(
      emailStr == freezed ? this.emailStr : emailStr as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String emailStr),
    @required Result usernameChanged(String usernameStr),
    @required Result passwordChanged(String passwordStr),
    @required Result registerPressed(),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(registerPressed != null);
    return emailChanged(emailStr);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String emailStr),
    Result usernameChanged(String usernameStr),
    Result passwordChanged(String passwordStr),
    Result registerPressed(),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(emailStr);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result emailChanged(EmailChanged value),
    @required Result usernameChanged(UsernameChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result registerPressed(RegisterPressed value),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(registerPressed != null);
    return emailChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result usernameChanged(UsernameChanged value),
    Result passwordChanged(PasswordChanged value),
    Result registerPressed(RegisterPressed value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (emailChanged != null) {
      return emailChanged(this);
    }
    return orElse();
  }
}

abstract class EmailChanged implements RegisterFormEvent {
  const factory EmailChanged(String emailStr) = _$EmailChanged;

  String get emailStr;

  EmailChanged copyWith({String emailStr});
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
  _$UsernameChanged copyWith({
    Object usernameStr = freezed,
  }) {
    return _$UsernameChanged(
      usernameStr == freezed ? this.usernameStr : usernameStr as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String emailStr),
    @required Result usernameChanged(String usernameStr),
    @required Result passwordChanged(String passwordStr),
    @required Result registerPressed(),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(registerPressed != null);
    return usernameChanged(usernameStr);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String emailStr),
    Result usernameChanged(String usernameStr),
    Result passwordChanged(String passwordStr),
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
    @required Result emailChanged(EmailChanged value),
    @required Result usernameChanged(UsernameChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result registerPressed(RegisterPressed value),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(registerPressed != null);
    return usernameChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result usernameChanged(UsernameChanged value),
    Result passwordChanged(PasswordChanged value),
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

  UsernameChanged copyWith({String usernameStr});
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
  _$PasswordChanged copyWith({
    Object passwordStr = freezed,
  }) {
    return _$PasswordChanged(
      passwordStr == freezed ? this.passwordStr : passwordStr as String,
    );
  }

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result emailChanged(String emailStr),
    @required Result usernameChanged(String usernameStr),
    @required Result passwordChanged(String passwordStr),
    @required Result registerPressed(),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(registerPressed != null);
    return passwordChanged(passwordStr);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String emailStr),
    Result usernameChanged(String usernameStr),
    Result passwordChanged(String passwordStr),
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
    @required Result emailChanged(EmailChanged value),
    @required Result usernameChanged(UsernameChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result registerPressed(RegisterPressed value),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(registerPressed != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result usernameChanged(UsernameChanged value),
    Result passwordChanged(PasswordChanged value),
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

  PasswordChanged copyWith({String passwordStr});
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
    @required Result emailChanged(String emailStr),
    @required Result usernameChanged(String usernameStr),
    @required Result passwordChanged(String passwordStr),
    @required Result registerPressed(),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(registerPressed != null);
    return registerPressed();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result emailChanged(String emailStr),
    Result usernameChanged(String usernameStr),
    Result passwordChanged(String passwordStr),
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
    @required Result emailChanged(EmailChanged value),
    @required Result usernameChanged(UsernameChanged value),
    @required Result passwordChanged(PasswordChanged value),
    @required Result registerPressed(RegisterPressed value),
  }) {
    assert(emailChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(registerPressed != null);
    return registerPressed(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result emailChanged(EmailChanged value),
    Result usernameChanged(UsernameChanged value),
    Result passwordChanged(PasswordChanged value),
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

mixin _$RegisterFormState {
  EmailAddress get emailAddress;
  Username get username;
  Password get password;
  bool get showErrorMessages;
  bool get isSubmitting;
  Option<Either<RegisterFailure, Unit>> get authFailureOrSuccessOption;

  RegisterFormState copyWith(
      {EmailAddress emailAddress,
      Username username,
      Password password,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<RegisterFailure, Unit>> authFailureOrSuccessOption});
}

class _$RegisterFormStateTearOff {
  const _$RegisterFormStateTearOff();

  _RegisterFormState call(
      {@required
          EmailAddress emailAddress,
      @required
          Username username,
      @required
          Password password,
      @required
          bool showErrorMessages,
      @required
          bool isSubmitting,
      @required
          Option<Either<RegisterFailure, Unit>> authFailureOrSuccessOption}) {
    return _RegisterFormState(
      emailAddress: emailAddress,
      username: username,
      password: password,
      showErrorMessages: showErrorMessages,
      isSubmitting: isSubmitting,
      authFailureOrSuccessOption: authFailureOrSuccessOption,
    );
  }
}

const $RegisterFormState = _$RegisterFormStateTearOff();

class _$_RegisterFormState implements _RegisterFormState {
  const _$_RegisterFormState(
      {@required this.emailAddress,
      @required this.username,
      @required this.password,
      @required this.showErrorMessages,
      @required this.isSubmitting,
      @required this.authFailureOrSuccessOption})
      : assert(emailAddress != null),
        assert(username != null),
        assert(password != null),
        assert(showErrorMessages != null),
        assert(isSubmitting != null),
        assert(authFailureOrSuccessOption != null);

  @override
  final EmailAddress emailAddress;
  @override
  final Username username;
  @override
  final Password password;
  @override
  final bool showErrorMessages;
  @override
  final bool isSubmitting;
  @override
  final Option<Either<RegisterFailure, Unit>> authFailureOrSuccessOption;

  @override
  String toString() {
    return 'RegisterFormState(emailAddress: $emailAddress, username: $username, password: $password, showErrorMessages: $showErrorMessages, isSubmitting: $isSubmitting, authFailureOrSuccessOption: $authFailureOrSuccessOption)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _RegisterFormState &&
            (identical(other.emailAddress, emailAddress) ||
                const DeepCollectionEquality()
                    .equals(other.emailAddress, emailAddress)) &&
            (identical(other.username, username) ||
                const DeepCollectionEquality()
                    .equals(other.username, username)) &&
            (identical(other.password, password) ||
                const DeepCollectionEquality()
                    .equals(other.password, password)) &&
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
      const DeepCollectionEquality().hash(emailAddress) ^
      const DeepCollectionEquality().hash(username) ^
      const DeepCollectionEquality().hash(password) ^
      const DeepCollectionEquality().hash(showErrorMessages) ^
      const DeepCollectionEquality().hash(isSubmitting) ^
      const DeepCollectionEquality().hash(authFailureOrSuccessOption);

  @override
  _$_RegisterFormState copyWith({
    Object emailAddress = freezed,
    Object username = freezed,
    Object password = freezed,
    Object showErrorMessages = freezed,
    Object isSubmitting = freezed,
    Object authFailureOrSuccessOption = freezed,
  }) {
    return _$_RegisterFormState(
      emailAddress: emailAddress == freezed
          ? this.emailAddress
          : emailAddress as EmailAddress,
      username: username == freezed ? this.username : username as Username,
      password: password == freezed ? this.password : password as Password,
      showErrorMessages: showErrorMessages == freezed
          ? this.showErrorMessages
          : showErrorMessages as bool,
      isSubmitting:
          isSubmitting == freezed ? this.isSubmitting : isSubmitting as bool,
      authFailureOrSuccessOption: authFailureOrSuccessOption == freezed
          ? this.authFailureOrSuccessOption
          : authFailureOrSuccessOption as Option<Either<RegisterFailure, Unit>>,
    );
  }
}

abstract class _RegisterFormState implements RegisterFormState {
  const factory _RegisterFormState(
      {@required
          EmailAddress emailAddress,
      @required
          Username username,
      @required
          Password password,
      @required
          bool showErrorMessages,
      @required
          bool isSubmitting,
      @required
          Option<Either<RegisterFailure, Unit>>
              authFailureOrSuccessOption}) = _$_RegisterFormState;

  @override
  EmailAddress get emailAddress;
  @override
  Username get username;
  @override
  Password get password;
  @override
  bool get showErrorMessages;
  @override
  bool get isSubmitting;
  @override
  Option<Either<RegisterFailure, Unit>> get authFailureOrSuccessOption;

  @override
  _RegisterFormState copyWith(
      {EmailAddress emailAddress,
      Username username,
      Password password,
      bool showErrorMessages,
      bool isSubmitting,
      Option<Either<RegisterFailure, Unit>> authFailureOrSuccessOption});
}
