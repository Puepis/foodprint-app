// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named

part of 'account_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

class _$AccountEventTearOff {
  const _$AccountEventTearOff();

  AvatarChanged avatarChanged(
      {@required JWT accessToken, @required File newAvatarFile}) {
    return AvatarChanged(
      accessToken: accessToken,
      newAvatarFile: newAvatarFile,
    );
  }

  AccountUsernameChanged usernameChanged(
      {@required JWT accessToken, @required String newUsername}) {
    return AccountUsernameChanged(
      accessToken: accessToken,
      newUsername: newUsername,
    );
  }

  AccountPasswordChanged passwordChanged(
      {@required JWT accessToken,
      @required String oldPassword,
      @required String newPassword}) {
    return AccountPasswordChanged(
      accessToken: accessToken,
      oldPassword: oldPassword,
      newPassword: newPassword,
    );
  }

  AccountDeleted accountDeleted({@required JWT accessToken}) {
    return AccountDeleted(
      accessToken: accessToken,
    );
  }
}

// ignore: unused_element
const $AccountEvent = _$AccountEventTearOff();

mixin _$AccountEvent {
  JWT get accessToken;

  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result avatarChanged(JWT accessToken, File newAvatarFile),
    @required Result usernameChanged(JWT accessToken, String newUsername),
    @required
        Result passwordChanged(
            JWT accessToken, String oldPassword, String newPassword),
    @required Result accountDeleted(JWT accessToken),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result avatarChanged(JWT accessToken, File newAvatarFile),
    Result usernameChanged(JWT accessToken, String newUsername),
    Result passwordChanged(
        JWT accessToken, String oldPassword, String newPassword),
    Result accountDeleted(JWT accessToken),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result avatarChanged(AvatarChanged value),
    @required Result usernameChanged(AccountUsernameChanged value),
    @required Result passwordChanged(AccountPasswordChanged value),
    @required Result accountDeleted(AccountDeleted value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result avatarChanged(AvatarChanged value),
    Result usernameChanged(AccountUsernameChanged value),
    Result passwordChanged(AccountPasswordChanged value),
    Result accountDeleted(AccountDeleted value),
    @required Result orElse(),
  });

  $AccountEventCopyWith<AccountEvent> get copyWith;
}

abstract class $AccountEventCopyWith<$Res> {
  factory $AccountEventCopyWith(
          AccountEvent value, $Res Function(AccountEvent) then) =
      _$AccountEventCopyWithImpl<$Res>;
  $Res call({JWT accessToken});
}

class _$AccountEventCopyWithImpl<$Res> implements $AccountEventCopyWith<$Res> {
  _$AccountEventCopyWithImpl(this._value, this._then);

  final AccountEvent _value;
  // ignore: unused_field
  final $Res Function(AccountEvent) _then;

  @override
  $Res call({
    Object accessToken = freezed,
  }) {
    return _then(_value.copyWith(
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as JWT,
    ));
  }
}

abstract class $AvatarChangedCopyWith<$Res>
    implements $AccountEventCopyWith<$Res> {
  factory $AvatarChangedCopyWith(
          AvatarChanged value, $Res Function(AvatarChanged) then) =
      _$AvatarChangedCopyWithImpl<$Res>;
  @override
  $Res call({JWT accessToken, File newAvatarFile});
}

class _$AvatarChangedCopyWithImpl<$Res> extends _$AccountEventCopyWithImpl<$Res>
    implements $AvatarChangedCopyWith<$Res> {
  _$AvatarChangedCopyWithImpl(
      AvatarChanged _value, $Res Function(AvatarChanged) _then)
      : super(_value, (v) => _then(v as AvatarChanged));

  @override
  AvatarChanged get _value => super._value as AvatarChanged;

  @override
  $Res call({
    Object accessToken = freezed,
    Object newAvatarFile = freezed,
  }) {
    return _then(AvatarChanged(
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as JWT,
      newAvatarFile: newAvatarFile == freezed
          ? _value.newAvatarFile
          : newAvatarFile as File,
    ));
  }
}

class _$AvatarChanged with DiagnosticableTreeMixin implements AvatarChanged {
  const _$AvatarChanged(
      {@required this.accessToken, @required this.newAvatarFile})
      : assert(accessToken != null),
        assert(newAvatarFile != null);

  @override
  final JWT accessToken;
  @override
  final File newAvatarFile;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountEvent.avatarChanged(accessToken: $accessToken, newAvatarFile: $newAvatarFile)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountEvent.avatarChanged'))
      ..add(DiagnosticsProperty('accessToken', accessToken))
      ..add(DiagnosticsProperty('newAvatarFile', newAvatarFile));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AvatarChanged &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.newAvatarFile, newAvatarFile) ||
                const DeepCollectionEquality()
                    .equals(other.newAvatarFile, newAvatarFile)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(newAvatarFile);

  @override
  $AvatarChangedCopyWith<AvatarChanged> get copyWith =>
      _$AvatarChangedCopyWithImpl<AvatarChanged>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result avatarChanged(JWT accessToken, File newAvatarFile),
    @required Result usernameChanged(JWT accessToken, String newUsername),
    @required
        Result passwordChanged(
            JWT accessToken, String oldPassword, String newPassword),
    @required Result accountDeleted(JWT accessToken),
  }) {
    assert(avatarChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(accountDeleted != null);
    return avatarChanged(accessToken, newAvatarFile);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result avatarChanged(JWT accessToken, File newAvatarFile),
    Result usernameChanged(JWT accessToken, String newUsername),
    Result passwordChanged(
        JWT accessToken, String oldPassword, String newPassword),
    Result accountDeleted(JWT accessToken),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (avatarChanged != null) {
      return avatarChanged(accessToken, newAvatarFile);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result avatarChanged(AvatarChanged value),
    @required Result usernameChanged(AccountUsernameChanged value),
    @required Result passwordChanged(AccountPasswordChanged value),
    @required Result accountDeleted(AccountDeleted value),
  }) {
    assert(avatarChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(accountDeleted != null);
    return avatarChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result avatarChanged(AvatarChanged value),
    Result usernameChanged(AccountUsernameChanged value),
    Result passwordChanged(AccountPasswordChanged value),
    Result accountDeleted(AccountDeleted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (avatarChanged != null) {
      return avatarChanged(this);
    }
    return orElse();
  }
}

abstract class AvatarChanged implements AccountEvent {
  const factory AvatarChanged(
      {@required JWT accessToken,
      @required File newAvatarFile}) = _$AvatarChanged;

  @override
  JWT get accessToken;
  File get newAvatarFile;
  @override
  $AvatarChangedCopyWith<AvatarChanged> get copyWith;
}

abstract class $AccountUsernameChangedCopyWith<$Res>
    implements $AccountEventCopyWith<$Res> {
  factory $AccountUsernameChangedCopyWith(AccountUsernameChanged value,
          $Res Function(AccountUsernameChanged) then) =
      _$AccountUsernameChangedCopyWithImpl<$Res>;
  @override
  $Res call({JWT accessToken, String newUsername});
}

class _$AccountUsernameChangedCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res>
    implements $AccountUsernameChangedCopyWith<$Res> {
  _$AccountUsernameChangedCopyWithImpl(AccountUsernameChanged _value,
      $Res Function(AccountUsernameChanged) _then)
      : super(_value, (v) => _then(v as AccountUsernameChanged));

  @override
  AccountUsernameChanged get _value => super._value as AccountUsernameChanged;

  @override
  $Res call({
    Object accessToken = freezed,
    Object newUsername = freezed,
  }) {
    return _then(AccountUsernameChanged(
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as JWT,
      newUsername:
          newUsername == freezed ? _value.newUsername : newUsername as String,
    ));
  }
}

class _$AccountUsernameChanged
    with DiagnosticableTreeMixin
    implements AccountUsernameChanged {
  const _$AccountUsernameChanged(
      {@required this.accessToken, @required this.newUsername})
      : assert(accessToken != null),
        assert(newUsername != null);

  @override
  final JWT accessToken;
  @override
  final String newUsername;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountEvent.usernameChanged(accessToken: $accessToken, newUsername: $newUsername)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountEvent.usernameChanged'))
      ..add(DiagnosticsProperty('accessToken', accessToken))
      ..add(DiagnosticsProperty('newUsername', newUsername));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AccountUsernameChanged &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.newUsername, newUsername) ||
                const DeepCollectionEquality()
                    .equals(other.newUsername, newUsername)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(newUsername);

  @override
  $AccountUsernameChangedCopyWith<AccountUsernameChanged> get copyWith =>
      _$AccountUsernameChangedCopyWithImpl<AccountUsernameChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result avatarChanged(JWT accessToken, File newAvatarFile),
    @required Result usernameChanged(JWT accessToken, String newUsername),
    @required
        Result passwordChanged(
            JWT accessToken, String oldPassword, String newPassword),
    @required Result accountDeleted(JWT accessToken),
  }) {
    assert(avatarChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(accountDeleted != null);
    return usernameChanged(accessToken, newUsername);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result avatarChanged(JWT accessToken, File newAvatarFile),
    Result usernameChanged(JWT accessToken, String newUsername),
    Result passwordChanged(
        JWT accessToken, String oldPassword, String newPassword),
    Result accountDeleted(JWT accessToken),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (usernameChanged != null) {
      return usernameChanged(accessToken, newUsername);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result avatarChanged(AvatarChanged value),
    @required Result usernameChanged(AccountUsernameChanged value),
    @required Result passwordChanged(AccountPasswordChanged value),
    @required Result accountDeleted(AccountDeleted value),
  }) {
    assert(avatarChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(accountDeleted != null);
    return usernameChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result avatarChanged(AvatarChanged value),
    Result usernameChanged(AccountUsernameChanged value),
    Result passwordChanged(AccountPasswordChanged value),
    Result accountDeleted(AccountDeleted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (usernameChanged != null) {
      return usernameChanged(this);
    }
    return orElse();
  }
}

abstract class AccountUsernameChanged implements AccountEvent {
  const factory AccountUsernameChanged(
      {@required JWT accessToken,
      @required String newUsername}) = _$AccountUsernameChanged;

  @override
  JWT get accessToken;
  String get newUsername;
  @override
  $AccountUsernameChangedCopyWith<AccountUsernameChanged> get copyWith;
}

abstract class $AccountPasswordChangedCopyWith<$Res>
    implements $AccountEventCopyWith<$Res> {
  factory $AccountPasswordChangedCopyWith(AccountPasswordChanged value,
          $Res Function(AccountPasswordChanged) then) =
      _$AccountPasswordChangedCopyWithImpl<$Res>;
  @override
  $Res call({JWT accessToken, String oldPassword, String newPassword});
}

class _$AccountPasswordChangedCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res>
    implements $AccountPasswordChangedCopyWith<$Res> {
  _$AccountPasswordChangedCopyWithImpl(AccountPasswordChanged _value,
      $Res Function(AccountPasswordChanged) _then)
      : super(_value, (v) => _then(v as AccountPasswordChanged));

  @override
  AccountPasswordChanged get _value => super._value as AccountPasswordChanged;

  @override
  $Res call({
    Object accessToken = freezed,
    Object oldPassword = freezed,
    Object newPassword = freezed,
  }) {
    return _then(AccountPasswordChanged(
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as JWT,
      oldPassword:
          oldPassword == freezed ? _value.oldPassword : oldPassword as String,
      newPassword:
          newPassword == freezed ? _value.newPassword : newPassword as String,
    ));
  }
}

class _$AccountPasswordChanged
    with DiagnosticableTreeMixin
    implements AccountPasswordChanged {
  const _$AccountPasswordChanged(
      {@required this.accessToken,
      @required this.oldPassword,
      @required this.newPassword})
      : assert(accessToken != null),
        assert(oldPassword != null),
        assert(newPassword != null);

  @override
  final JWT accessToken;
  @override
  final String oldPassword;
  @override
  final String newPassword;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountEvent.passwordChanged(accessToken: $accessToken, oldPassword: $oldPassword, newPassword: $newPassword)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountEvent.passwordChanged'))
      ..add(DiagnosticsProperty('accessToken', accessToken))
      ..add(DiagnosticsProperty('oldPassword', oldPassword))
      ..add(DiagnosticsProperty('newPassword', newPassword));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AccountPasswordChanged &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)) &&
            (identical(other.oldPassword, oldPassword) ||
                const DeepCollectionEquality()
                    .equals(other.oldPassword, oldPassword)) &&
            (identical(other.newPassword, newPassword) ||
                const DeepCollectionEquality()
                    .equals(other.newPassword, newPassword)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(accessToken) ^
      const DeepCollectionEquality().hash(oldPassword) ^
      const DeepCollectionEquality().hash(newPassword);

  @override
  $AccountPasswordChangedCopyWith<AccountPasswordChanged> get copyWith =>
      _$AccountPasswordChangedCopyWithImpl<AccountPasswordChanged>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result avatarChanged(JWT accessToken, File newAvatarFile),
    @required Result usernameChanged(JWT accessToken, String newUsername),
    @required
        Result passwordChanged(
            JWT accessToken, String oldPassword, String newPassword),
    @required Result accountDeleted(JWT accessToken),
  }) {
    assert(avatarChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(accountDeleted != null);
    return passwordChanged(accessToken, oldPassword, newPassword);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result avatarChanged(JWT accessToken, File newAvatarFile),
    Result usernameChanged(JWT accessToken, String newUsername),
    Result passwordChanged(
        JWT accessToken, String oldPassword, String newPassword),
    Result accountDeleted(JWT accessToken),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(accessToken, oldPassword, newPassword);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result avatarChanged(AvatarChanged value),
    @required Result usernameChanged(AccountUsernameChanged value),
    @required Result passwordChanged(AccountPasswordChanged value),
    @required Result accountDeleted(AccountDeleted value),
  }) {
    assert(avatarChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(accountDeleted != null);
    return passwordChanged(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result avatarChanged(AvatarChanged value),
    Result usernameChanged(AccountUsernameChanged value),
    Result passwordChanged(AccountPasswordChanged value),
    Result accountDeleted(AccountDeleted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChanged != null) {
      return passwordChanged(this);
    }
    return orElse();
  }
}

abstract class AccountPasswordChanged implements AccountEvent {
  const factory AccountPasswordChanged(
      {@required JWT accessToken,
      @required String oldPassword,
      @required String newPassword}) = _$AccountPasswordChanged;

  @override
  JWT get accessToken;
  String get oldPassword;
  String get newPassword;
  @override
  $AccountPasswordChangedCopyWith<AccountPasswordChanged> get copyWith;
}

abstract class $AccountDeletedCopyWith<$Res>
    implements $AccountEventCopyWith<$Res> {
  factory $AccountDeletedCopyWith(
          AccountDeleted value, $Res Function(AccountDeleted) then) =
      _$AccountDeletedCopyWithImpl<$Res>;
  @override
  $Res call({JWT accessToken});
}

class _$AccountDeletedCopyWithImpl<$Res>
    extends _$AccountEventCopyWithImpl<$Res>
    implements $AccountDeletedCopyWith<$Res> {
  _$AccountDeletedCopyWithImpl(
      AccountDeleted _value, $Res Function(AccountDeleted) _then)
      : super(_value, (v) => _then(v as AccountDeleted));

  @override
  AccountDeleted get _value => super._value as AccountDeleted;

  @override
  $Res call({
    Object accessToken = freezed,
  }) {
    return _then(AccountDeleted(
      accessToken:
          accessToken == freezed ? _value.accessToken : accessToken as JWT,
    ));
  }
}

class _$AccountDeleted with DiagnosticableTreeMixin implements AccountDeleted {
  const _$AccountDeleted({@required this.accessToken})
      : assert(accessToken != null);

  @override
  final JWT accessToken;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountEvent.accountDeleted(accessToken: $accessToken)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountEvent.accountDeleted'))
      ..add(DiagnosticsProperty('accessToken', accessToken));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AccountDeleted &&
            (identical(other.accessToken, accessToken) ||
                const DeepCollectionEquality()
                    .equals(other.accessToken, accessToken)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(accessToken);

  @override
  $AccountDeletedCopyWith<AccountDeleted> get copyWith =>
      _$AccountDeletedCopyWithImpl<AccountDeleted>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result avatarChanged(JWT accessToken, File newAvatarFile),
    @required Result usernameChanged(JWT accessToken, String newUsername),
    @required
        Result passwordChanged(
            JWT accessToken, String oldPassword, String newPassword),
    @required Result accountDeleted(JWT accessToken),
  }) {
    assert(avatarChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(accountDeleted != null);
    return accountDeleted(accessToken);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result avatarChanged(JWT accessToken, File newAvatarFile),
    Result usernameChanged(JWT accessToken, String newUsername),
    Result passwordChanged(
        JWT accessToken, String oldPassword, String newPassword),
    Result accountDeleted(JWT accessToken),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (accountDeleted != null) {
      return accountDeleted(accessToken);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result avatarChanged(AvatarChanged value),
    @required Result usernameChanged(AccountUsernameChanged value),
    @required Result passwordChanged(AccountPasswordChanged value),
    @required Result accountDeleted(AccountDeleted value),
  }) {
    assert(avatarChanged != null);
    assert(usernameChanged != null);
    assert(passwordChanged != null);
    assert(accountDeleted != null);
    return accountDeleted(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result avatarChanged(AvatarChanged value),
    Result usernameChanged(AccountUsernameChanged value),
    Result passwordChanged(AccountPasswordChanged value),
    Result accountDeleted(AccountDeleted value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (accountDeleted != null) {
      return accountDeleted(this);
    }
    return orElse();
  }
}

abstract class AccountDeleted implements AccountEvent {
  const factory AccountDeleted({@required JWT accessToken}) = _$AccountDeleted;

  @override
  JWT get accessToken;
  @override
  $AccountDeletedCopyWith<AccountDeleted> get copyWith;
}

class _$AccountStateTearOff {
  const _$AccountStateTearOff();

  Initial initial() {
    return const Initial();
  }

  AvatarChangeLoading avatarChangeLoading() {
    return const AvatarChangeLoading();
  }

  UsernameChangeLoading usernameChangeLoading() {
    return const UsernameChangeLoading();
  }

  PasswordChangeLoading passwordChangeLoading() {
    return const PasswordChangeLoading();
  }

  DeleteAccountLoading deleteAccountLoading() {
    return const DeleteAccountLoading();
  }

  UsernameChangeSuccess usernameChangeSuccess({@required JWT token}) {
    return UsernameChangeSuccess(
      token: token,
    );
  }

  PasswordChangeSuccess passwordChangeSuccess() {
    return const PasswordChangeSuccess();
  }

  AvatarChangeSuccess avatarChangeSuccess({@required JWT token}) {
    return AvatarChangeSuccess(
      token: token,
    );
  }

  DeleteAccountSuccess deleteAccountSuccess() {
    return const DeleteAccountSuccess();
  }

  UsernameChangeError usernameChangeError({@required AccountFailure failure}) {
    return UsernameChangeError(
      failure: failure,
    );
  }

  PasswordChangeError passwordChangeError({@required AccountFailure failure}) {
    return PasswordChangeError(
      failure: failure,
    );
  }

  AvatarChangeError avatarChangeError({@required AccountFailure failure}) {
    return AvatarChangeError(
      failure: failure,
    );
  }

  DeleteAccountError deleteAccountError({@required AccountFailure failure}) {
    return DeleteAccountError(
      failure: failure,
    );
  }
}

// ignore: unused_element
const $AccountState = _$AccountStateTearOff();

mixin _$AccountState {
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result avatarChangeLoading(),
    @required Result usernameChangeLoading(),
    @required Result passwordChangeLoading(),
    @required Result deleteAccountLoading(),
    @required Result usernameChangeSuccess(JWT token),
    @required Result passwordChangeSuccess(),
    @required Result avatarChangeSuccess(JWT token),
    @required Result deleteAccountSuccess(),
    @required Result usernameChangeError(AccountFailure failure),
    @required Result passwordChangeError(AccountFailure failure),
    @required Result avatarChangeError(AccountFailure failure),
    @required Result deleteAccountError(AccountFailure failure),
  });
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result avatarChangeLoading(),
    Result usernameChangeLoading(),
    Result passwordChangeLoading(),
    Result deleteAccountLoading(),
    Result usernameChangeSuccess(JWT token),
    Result passwordChangeSuccess(),
    Result avatarChangeSuccess(JWT token),
    Result deleteAccountSuccess(),
    Result usernameChangeError(AccountFailure failure),
    Result passwordChangeError(AccountFailure failure),
    Result avatarChangeError(AccountFailure failure),
    Result deleteAccountError(AccountFailure failure),
    @required Result orElse(),
  });
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result avatarChangeLoading(AvatarChangeLoading value),
    @required Result usernameChangeLoading(UsernameChangeLoading value),
    @required Result passwordChangeLoading(PasswordChangeLoading value),
    @required Result deleteAccountLoading(DeleteAccountLoading value),
    @required Result usernameChangeSuccess(UsernameChangeSuccess value),
    @required Result passwordChangeSuccess(PasswordChangeSuccess value),
    @required Result avatarChangeSuccess(AvatarChangeSuccess value),
    @required Result deleteAccountSuccess(DeleteAccountSuccess value),
    @required Result usernameChangeError(UsernameChangeError value),
    @required Result passwordChangeError(PasswordChangeError value),
    @required Result avatarChangeError(AvatarChangeError value),
    @required Result deleteAccountError(DeleteAccountError value),
  });
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result avatarChangeLoading(AvatarChangeLoading value),
    Result usernameChangeLoading(UsernameChangeLoading value),
    Result passwordChangeLoading(PasswordChangeLoading value),
    Result deleteAccountLoading(DeleteAccountLoading value),
    Result usernameChangeSuccess(UsernameChangeSuccess value),
    Result passwordChangeSuccess(PasswordChangeSuccess value),
    Result avatarChangeSuccess(AvatarChangeSuccess value),
    Result deleteAccountSuccess(DeleteAccountSuccess value),
    Result usernameChangeError(UsernameChangeError value),
    Result passwordChangeError(PasswordChangeError value),
    Result avatarChangeError(AvatarChangeError value),
    Result deleteAccountError(DeleteAccountError value),
    @required Result orElse(),
  });
}

abstract class $AccountStateCopyWith<$Res> {
  factory $AccountStateCopyWith(
          AccountState value, $Res Function(AccountState) then) =
      _$AccountStateCopyWithImpl<$Res>;
}

class _$AccountStateCopyWithImpl<$Res> implements $AccountStateCopyWith<$Res> {
  _$AccountStateCopyWithImpl(this._value, this._then);

  final AccountState _value;
  // ignore: unused_field
  final $Res Function(AccountState) _then;
}

abstract class $InitialCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) then) =
      _$InitialCopyWithImpl<$Res>;
}

class _$InitialCopyWithImpl<$Res> extends _$AccountStateCopyWithImpl<$Res>
    implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(Initial _value, $Res Function(Initial) _then)
      : super(_value, (v) => _then(v as Initial));

  @override
  Initial get _value => super._value as Initial;
}

class _$Initial with DiagnosticableTreeMixin implements Initial {
  const _$Initial();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState.initial()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties..add(DiagnosticsProperty('type', 'AccountState.initial'));
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
    @required Result avatarChangeLoading(),
    @required Result usernameChangeLoading(),
    @required Result passwordChangeLoading(),
    @required Result deleteAccountLoading(),
    @required Result usernameChangeSuccess(JWT token),
    @required Result passwordChangeSuccess(),
    @required Result avatarChangeSuccess(JWT token),
    @required Result deleteAccountSuccess(),
    @required Result usernameChangeError(AccountFailure failure),
    @required Result passwordChangeError(AccountFailure failure),
    @required Result avatarChangeError(AccountFailure failure),
    @required Result deleteAccountError(AccountFailure failure),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return initial();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result avatarChangeLoading(),
    Result usernameChangeLoading(),
    Result passwordChangeLoading(),
    Result deleteAccountLoading(),
    Result usernameChangeSuccess(JWT token),
    Result passwordChangeSuccess(),
    Result avatarChangeSuccess(JWT token),
    Result deleteAccountSuccess(),
    Result usernameChangeError(AccountFailure failure),
    Result passwordChangeError(AccountFailure failure),
    Result avatarChangeError(AccountFailure failure),
    Result deleteAccountError(AccountFailure failure),
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
    @required Result avatarChangeLoading(AvatarChangeLoading value),
    @required Result usernameChangeLoading(UsernameChangeLoading value),
    @required Result passwordChangeLoading(PasswordChangeLoading value),
    @required Result deleteAccountLoading(DeleteAccountLoading value),
    @required Result usernameChangeSuccess(UsernameChangeSuccess value),
    @required Result passwordChangeSuccess(PasswordChangeSuccess value),
    @required Result avatarChangeSuccess(AvatarChangeSuccess value),
    @required Result deleteAccountSuccess(DeleteAccountSuccess value),
    @required Result usernameChangeError(UsernameChangeError value),
    @required Result passwordChangeError(PasswordChangeError value),
    @required Result avatarChangeError(AvatarChangeError value),
    @required Result deleteAccountError(DeleteAccountError value),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return initial(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result avatarChangeLoading(AvatarChangeLoading value),
    Result usernameChangeLoading(UsernameChangeLoading value),
    Result passwordChangeLoading(PasswordChangeLoading value),
    Result deleteAccountLoading(DeleteAccountLoading value),
    Result usernameChangeSuccess(UsernameChangeSuccess value),
    Result passwordChangeSuccess(PasswordChangeSuccess value),
    Result avatarChangeSuccess(AvatarChangeSuccess value),
    Result deleteAccountSuccess(DeleteAccountSuccess value),
    Result usernameChangeError(UsernameChangeError value),
    Result passwordChangeError(PasswordChangeError value),
    Result avatarChangeError(AvatarChangeError value),
    Result deleteAccountError(DeleteAccountError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class Initial implements AccountState {
  const factory Initial() = _$Initial;
}

abstract class $AvatarChangeLoadingCopyWith<$Res> {
  factory $AvatarChangeLoadingCopyWith(
          AvatarChangeLoading value, $Res Function(AvatarChangeLoading) then) =
      _$AvatarChangeLoadingCopyWithImpl<$Res>;
}

class _$AvatarChangeLoadingCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements $AvatarChangeLoadingCopyWith<$Res> {
  _$AvatarChangeLoadingCopyWithImpl(
      AvatarChangeLoading _value, $Res Function(AvatarChangeLoading) _then)
      : super(_value, (v) => _then(v as AvatarChangeLoading));

  @override
  AvatarChangeLoading get _value => super._value as AvatarChangeLoading;
}

class _$AvatarChangeLoading
    with DiagnosticableTreeMixin
    implements AvatarChangeLoading {
  const _$AvatarChangeLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState.avatarChangeLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState.avatarChangeLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is AvatarChangeLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result avatarChangeLoading(),
    @required Result usernameChangeLoading(),
    @required Result passwordChangeLoading(),
    @required Result deleteAccountLoading(),
    @required Result usernameChangeSuccess(JWT token),
    @required Result passwordChangeSuccess(),
    @required Result avatarChangeSuccess(JWT token),
    @required Result deleteAccountSuccess(),
    @required Result usernameChangeError(AccountFailure failure),
    @required Result passwordChangeError(AccountFailure failure),
    @required Result avatarChangeError(AccountFailure failure),
    @required Result deleteAccountError(AccountFailure failure),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return avatarChangeLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result avatarChangeLoading(),
    Result usernameChangeLoading(),
    Result passwordChangeLoading(),
    Result deleteAccountLoading(),
    Result usernameChangeSuccess(JWT token),
    Result passwordChangeSuccess(),
    Result avatarChangeSuccess(JWT token),
    Result deleteAccountSuccess(),
    Result usernameChangeError(AccountFailure failure),
    Result passwordChangeError(AccountFailure failure),
    Result avatarChangeError(AccountFailure failure),
    Result deleteAccountError(AccountFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (avatarChangeLoading != null) {
      return avatarChangeLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result avatarChangeLoading(AvatarChangeLoading value),
    @required Result usernameChangeLoading(UsernameChangeLoading value),
    @required Result passwordChangeLoading(PasswordChangeLoading value),
    @required Result deleteAccountLoading(DeleteAccountLoading value),
    @required Result usernameChangeSuccess(UsernameChangeSuccess value),
    @required Result passwordChangeSuccess(PasswordChangeSuccess value),
    @required Result avatarChangeSuccess(AvatarChangeSuccess value),
    @required Result deleteAccountSuccess(DeleteAccountSuccess value),
    @required Result usernameChangeError(UsernameChangeError value),
    @required Result passwordChangeError(PasswordChangeError value),
    @required Result avatarChangeError(AvatarChangeError value),
    @required Result deleteAccountError(DeleteAccountError value),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return avatarChangeLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result avatarChangeLoading(AvatarChangeLoading value),
    Result usernameChangeLoading(UsernameChangeLoading value),
    Result passwordChangeLoading(PasswordChangeLoading value),
    Result deleteAccountLoading(DeleteAccountLoading value),
    Result usernameChangeSuccess(UsernameChangeSuccess value),
    Result passwordChangeSuccess(PasswordChangeSuccess value),
    Result avatarChangeSuccess(AvatarChangeSuccess value),
    Result deleteAccountSuccess(DeleteAccountSuccess value),
    Result usernameChangeError(UsernameChangeError value),
    Result passwordChangeError(PasswordChangeError value),
    Result avatarChangeError(AvatarChangeError value),
    Result deleteAccountError(DeleteAccountError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (avatarChangeLoading != null) {
      return avatarChangeLoading(this);
    }
    return orElse();
  }
}

abstract class AvatarChangeLoading implements AccountState {
  const factory AvatarChangeLoading() = _$AvatarChangeLoading;
}

abstract class $UsernameChangeLoadingCopyWith<$Res> {
  factory $UsernameChangeLoadingCopyWith(UsernameChangeLoading value,
          $Res Function(UsernameChangeLoading) then) =
      _$UsernameChangeLoadingCopyWithImpl<$Res>;
}

class _$UsernameChangeLoadingCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements $UsernameChangeLoadingCopyWith<$Res> {
  _$UsernameChangeLoadingCopyWithImpl(
      UsernameChangeLoading _value, $Res Function(UsernameChangeLoading) _then)
      : super(_value, (v) => _then(v as UsernameChangeLoading));

  @override
  UsernameChangeLoading get _value => super._value as UsernameChangeLoading;
}

class _$UsernameChangeLoading
    with DiagnosticableTreeMixin
    implements UsernameChangeLoading {
  const _$UsernameChangeLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState.usernameChangeLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState.usernameChangeLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is UsernameChangeLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result avatarChangeLoading(),
    @required Result usernameChangeLoading(),
    @required Result passwordChangeLoading(),
    @required Result deleteAccountLoading(),
    @required Result usernameChangeSuccess(JWT token),
    @required Result passwordChangeSuccess(),
    @required Result avatarChangeSuccess(JWT token),
    @required Result deleteAccountSuccess(),
    @required Result usernameChangeError(AccountFailure failure),
    @required Result passwordChangeError(AccountFailure failure),
    @required Result avatarChangeError(AccountFailure failure),
    @required Result deleteAccountError(AccountFailure failure),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return usernameChangeLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result avatarChangeLoading(),
    Result usernameChangeLoading(),
    Result passwordChangeLoading(),
    Result deleteAccountLoading(),
    Result usernameChangeSuccess(JWT token),
    Result passwordChangeSuccess(),
    Result avatarChangeSuccess(JWT token),
    Result deleteAccountSuccess(),
    Result usernameChangeError(AccountFailure failure),
    Result passwordChangeError(AccountFailure failure),
    Result avatarChangeError(AccountFailure failure),
    Result deleteAccountError(AccountFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (usernameChangeLoading != null) {
      return usernameChangeLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result avatarChangeLoading(AvatarChangeLoading value),
    @required Result usernameChangeLoading(UsernameChangeLoading value),
    @required Result passwordChangeLoading(PasswordChangeLoading value),
    @required Result deleteAccountLoading(DeleteAccountLoading value),
    @required Result usernameChangeSuccess(UsernameChangeSuccess value),
    @required Result passwordChangeSuccess(PasswordChangeSuccess value),
    @required Result avatarChangeSuccess(AvatarChangeSuccess value),
    @required Result deleteAccountSuccess(DeleteAccountSuccess value),
    @required Result usernameChangeError(UsernameChangeError value),
    @required Result passwordChangeError(PasswordChangeError value),
    @required Result avatarChangeError(AvatarChangeError value),
    @required Result deleteAccountError(DeleteAccountError value),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return usernameChangeLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result avatarChangeLoading(AvatarChangeLoading value),
    Result usernameChangeLoading(UsernameChangeLoading value),
    Result passwordChangeLoading(PasswordChangeLoading value),
    Result deleteAccountLoading(DeleteAccountLoading value),
    Result usernameChangeSuccess(UsernameChangeSuccess value),
    Result passwordChangeSuccess(PasswordChangeSuccess value),
    Result avatarChangeSuccess(AvatarChangeSuccess value),
    Result deleteAccountSuccess(DeleteAccountSuccess value),
    Result usernameChangeError(UsernameChangeError value),
    Result passwordChangeError(PasswordChangeError value),
    Result avatarChangeError(AvatarChangeError value),
    Result deleteAccountError(DeleteAccountError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (usernameChangeLoading != null) {
      return usernameChangeLoading(this);
    }
    return orElse();
  }
}

abstract class UsernameChangeLoading implements AccountState {
  const factory UsernameChangeLoading() = _$UsernameChangeLoading;
}

abstract class $PasswordChangeLoadingCopyWith<$Res> {
  factory $PasswordChangeLoadingCopyWith(PasswordChangeLoading value,
          $Res Function(PasswordChangeLoading) then) =
      _$PasswordChangeLoadingCopyWithImpl<$Res>;
}

class _$PasswordChangeLoadingCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements $PasswordChangeLoadingCopyWith<$Res> {
  _$PasswordChangeLoadingCopyWithImpl(
      PasswordChangeLoading _value, $Res Function(PasswordChangeLoading) _then)
      : super(_value, (v) => _then(v as PasswordChangeLoading));

  @override
  PasswordChangeLoading get _value => super._value as PasswordChangeLoading;
}

class _$PasswordChangeLoading
    with DiagnosticableTreeMixin
    implements PasswordChangeLoading {
  const _$PasswordChangeLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState.passwordChangeLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState.passwordChangeLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PasswordChangeLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result avatarChangeLoading(),
    @required Result usernameChangeLoading(),
    @required Result passwordChangeLoading(),
    @required Result deleteAccountLoading(),
    @required Result usernameChangeSuccess(JWT token),
    @required Result passwordChangeSuccess(),
    @required Result avatarChangeSuccess(JWT token),
    @required Result deleteAccountSuccess(),
    @required Result usernameChangeError(AccountFailure failure),
    @required Result passwordChangeError(AccountFailure failure),
    @required Result avatarChangeError(AccountFailure failure),
    @required Result deleteAccountError(AccountFailure failure),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return passwordChangeLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result avatarChangeLoading(),
    Result usernameChangeLoading(),
    Result passwordChangeLoading(),
    Result deleteAccountLoading(),
    Result usernameChangeSuccess(JWT token),
    Result passwordChangeSuccess(),
    Result avatarChangeSuccess(JWT token),
    Result deleteAccountSuccess(),
    Result usernameChangeError(AccountFailure failure),
    Result passwordChangeError(AccountFailure failure),
    Result avatarChangeError(AccountFailure failure),
    Result deleteAccountError(AccountFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChangeLoading != null) {
      return passwordChangeLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result avatarChangeLoading(AvatarChangeLoading value),
    @required Result usernameChangeLoading(UsernameChangeLoading value),
    @required Result passwordChangeLoading(PasswordChangeLoading value),
    @required Result deleteAccountLoading(DeleteAccountLoading value),
    @required Result usernameChangeSuccess(UsernameChangeSuccess value),
    @required Result passwordChangeSuccess(PasswordChangeSuccess value),
    @required Result avatarChangeSuccess(AvatarChangeSuccess value),
    @required Result deleteAccountSuccess(DeleteAccountSuccess value),
    @required Result usernameChangeError(UsernameChangeError value),
    @required Result passwordChangeError(PasswordChangeError value),
    @required Result avatarChangeError(AvatarChangeError value),
    @required Result deleteAccountError(DeleteAccountError value),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return passwordChangeLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result avatarChangeLoading(AvatarChangeLoading value),
    Result usernameChangeLoading(UsernameChangeLoading value),
    Result passwordChangeLoading(PasswordChangeLoading value),
    Result deleteAccountLoading(DeleteAccountLoading value),
    Result usernameChangeSuccess(UsernameChangeSuccess value),
    Result passwordChangeSuccess(PasswordChangeSuccess value),
    Result avatarChangeSuccess(AvatarChangeSuccess value),
    Result deleteAccountSuccess(DeleteAccountSuccess value),
    Result usernameChangeError(UsernameChangeError value),
    Result passwordChangeError(PasswordChangeError value),
    Result avatarChangeError(AvatarChangeError value),
    Result deleteAccountError(DeleteAccountError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChangeLoading != null) {
      return passwordChangeLoading(this);
    }
    return orElse();
  }
}

abstract class PasswordChangeLoading implements AccountState {
  const factory PasswordChangeLoading() = _$PasswordChangeLoading;
}

abstract class $DeleteAccountLoadingCopyWith<$Res> {
  factory $DeleteAccountLoadingCopyWith(DeleteAccountLoading value,
          $Res Function(DeleteAccountLoading) then) =
      _$DeleteAccountLoadingCopyWithImpl<$Res>;
}

class _$DeleteAccountLoadingCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements $DeleteAccountLoadingCopyWith<$Res> {
  _$DeleteAccountLoadingCopyWithImpl(
      DeleteAccountLoading _value, $Res Function(DeleteAccountLoading) _then)
      : super(_value, (v) => _then(v as DeleteAccountLoading));

  @override
  DeleteAccountLoading get _value => super._value as DeleteAccountLoading;
}

class _$DeleteAccountLoading
    with DiagnosticableTreeMixin
    implements DeleteAccountLoading {
  const _$DeleteAccountLoading();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState.deleteAccountLoading()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState.deleteAccountLoading'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DeleteAccountLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result avatarChangeLoading(),
    @required Result usernameChangeLoading(),
    @required Result passwordChangeLoading(),
    @required Result deleteAccountLoading(),
    @required Result usernameChangeSuccess(JWT token),
    @required Result passwordChangeSuccess(),
    @required Result avatarChangeSuccess(JWT token),
    @required Result deleteAccountSuccess(),
    @required Result usernameChangeError(AccountFailure failure),
    @required Result passwordChangeError(AccountFailure failure),
    @required Result avatarChangeError(AccountFailure failure),
    @required Result deleteAccountError(AccountFailure failure),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return deleteAccountLoading();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result avatarChangeLoading(),
    Result usernameChangeLoading(),
    Result passwordChangeLoading(),
    Result deleteAccountLoading(),
    Result usernameChangeSuccess(JWT token),
    Result passwordChangeSuccess(),
    Result avatarChangeSuccess(JWT token),
    Result deleteAccountSuccess(),
    Result usernameChangeError(AccountFailure failure),
    Result passwordChangeError(AccountFailure failure),
    Result avatarChangeError(AccountFailure failure),
    Result deleteAccountError(AccountFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteAccountLoading != null) {
      return deleteAccountLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result avatarChangeLoading(AvatarChangeLoading value),
    @required Result usernameChangeLoading(UsernameChangeLoading value),
    @required Result passwordChangeLoading(PasswordChangeLoading value),
    @required Result deleteAccountLoading(DeleteAccountLoading value),
    @required Result usernameChangeSuccess(UsernameChangeSuccess value),
    @required Result passwordChangeSuccess(PasswordChangeSuccess value),
    @required Result avatarChangeSuccess(AvatarChangeSuccess value),
    @required Result deleteAccountSuccess(DeleteAccountSuccess value),
    @required Result usernameChangeError(UsernameChangeError value),
    @required Result passwordChangeError(PasswordChangeError value),
    @required Result avatarChangeError(AvatarChangeError value),
    @required Result deleteAccountError(DeleteAccountError value),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return deleteAccountLoading(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result avatarChangeLoading(AvatarChangeLoading value),
    Result usernameChangeLoading(UsernameChangeLoading value),
    Result passwordChangeLoading(PasswordChangeLoading value),
    Result deleteAccountLoading(DeleteAccountLoading value),
    Result usernameChangeSuccess(UsernameChangeSuccess value),
    Result passwordChangeSuccess(PasswordChangeSuccess value),
    Result avatarChangeSuccess(AvatarChangeSuccess value),
    Result deleteAccountSuccess(DeleteAccountSuccess value),
    Result usernameChangeError(UsernameChangeError value),
    Result passwordChangeError(PasswordChangeError value),
    Result avatarChangeError(AvatarChangeError value),
    Result deleteAccountError(DeleteAccountError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteAccountLoading != null) {
      return deleteAccountLoading(this);
    }
    return orElse();
  }
}

abstract class DeleteAccountLoading implements AccountState {
  const factory DeleteAccountLoading() = _$DeleteAccountLoading;
}

abstract class $UsernameChangeSuccessCopyWith<$Res> {
  factory $UsernameChangeSuccessCopyWith(UsernameChangeSuccess value,
          $Res Function(UsernameChangeSuccess) then) =
      _$UsernameChangeSuccessCopyWithImpl<$Res>;
  $Res call({JWT token});
}

class _$UsernameChangeSuccessCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements $UsernameChangeSuccessCopyWith<$Res> {
  _$UsernameChangeSuccessCopyWithImpl(
      UsernameChangeSuccess _value, $Res Function(UsernameChangeSuccess) _then)
      : super(_value, (v) => _then(v as UsernameChangeSuccess));

  @override
  UsernameChangeSuccess get _value => super._value as UsernameChangeSuccess;

  @override
  $Res call({
    Object token = freezed,
  }) {
    return _then(UsernameChangeSuccess(
      token: token == freezed ? _value.token : token as JWT,
    ));
  }
}

class _$UsernameChangeSuccess
    with DiagnosticableTreeMixin
    implements UsernameChangeSuccess {
  const _$UsernameChangeSuccess({@required this.token}) : assert(token != null);

  @override
  final JWT token;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState.usernameChangeSuccess(token: $token)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState.usernameChangeSuccess'))
      ..add(DiagnosticsProperty('token', token));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UsernameChangeSuccess &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(token);

  @override
  $UsernameChangeSuccessCopyWith<UsernameChangeSuccess> get copyWith =>
      _$UsernameChangeSuccessCopyWithImpl<UsernameChangeSuccess>(
          this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result avatarChangeLoading(),
    @required Result usernameChangeLoading(),
    @required Result passwordChangeLoading(),
    @required Result deleteAccountLoading(),
    @required Result usernameChangeSuccess(JWT token),
    @required Result passwordChangeSuccess(),
    @required Result avatarChangeSuccess(JWT token),
    @required Result deleteAccountSuccess(),
    @required Result usernameChangeError(AccountFailure failure),
    @required Result passwordChangeError(AccountFailure failure),
    @required Result avatarChangeError(AccountFailure failure),
    @required Result deleteAccountError(AccountFailure failure),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return usernameChangeSuccess(token);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result avatarChangeLoading(),
    Result usernameChangeLoading(),
    Result passwordChangeLoading(),
    Result deleteAccountLoading(),
    Result usernameChangeSuccess(JWT token),
    Result passwordChangeSuccess(),
    Result avatarChangeSuccess(JWT token),
    Result deleteAccountSuccess(),
    Result usernameChangeError(AccountFailure failure),
    Result passwordChangeError(AccountFailure failure),
    Result avatarChangeError(AccountFailure failure),
    Result deleteAccountError(AccountFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (usernameChangeSuccess != null) {
      return usernameChangeSuccess(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result avatarChangeLoading(AvatarChangeLoading value),
    @required Result usernameChangeLoading(UsernameChangeLoading value),
    @required Result passwordChangeLoading(PasswordChangeLoading value),
    @required Result deleteAccountLoading(DeleteAccountLoading value),
    @required Result usernameChangeSuccess(UsernameChangeSuccess value),
    @required Result passwordChangeSuccess(PasswordChangeSuccess value),
    @required Result avatarChangeSuccess(AvatarChangeSuccess value),
    @required Result deleteAccountSuccess(DeleteAccountSuccess value),
    @required Result usernameChangeError(UsernameChangeError value),
    @required Result passwordChangeError(PasswordChangeError value),
    @required Result avatarChangeError(AvatarChangeError value),
    @required Result deleteAccountError(DeleteAccountError value),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return usernameChangeSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result avatarChangeLoading(AvatarChangeLoading value),
    Result usernameChangeLoading(UsernameChangeLoading value),
    Result passwordChangeLoading(PasswordChangeLoading value),
    Result deleteAccountLoading(DeleteAccountLoading value),
    Result usernameChangeSuccess(UsernameChangeSuccess value),
    Result passwordChangeSuccess(PasswordChangeSuccess value),
    Result avatarChangeSuccess(AvatarChangeSuccess value),
    Result deleteAccountSuccess(DeleteAccountSuccess value),
    Result usernameChangeError(UsernameChangeError value),
    Result passwordChangeError(PasswordChangeError value),
    Result avatarChangeError(AvatarChangeError value),
    Result deleteAccountError(DeleteAccountError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (usernameChangeSuccess != null) {
      return usernameChangeSuccess(this);
    }
    return orElse();
  }
}

abstract class UsernameChangeSuccess implements AccountState {
  const factory UsernameChangeSuccess({@required JWT token}) =
      _$UsernameChangeSuccess;

  JWT get token;
  $UsernameChangeSuccessCopyWith<UsernameChangeSuccess> get copyWith;
}

abstract class $PasswordChangeSuccessCopyWith<$Res> {
  factory $PasswordChangeSuccessCopyWith(PasswordChangeSuccess value,
          $Res Function(PasswordChangeSuccess) then) =
      _$PasswordChangeSuccessCopyWithImpl<$Res>;
}

class _$PasswordChangeSuccessCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements $PasswordChangeSuccessCopyWith<$Res> {
  _$PasswordChangeSuccessCopyWithImpl(
      PasswordChangeSuccess _value, $Res Function(PasswordChangeSuccess) _then)
      : super(_value, (v) => _then(v as PasswordChangeSuccess));

  @override
  PasswordChangeSuccess get _value => super._value as PasswordChangeSuccess;
}

class _$PasswordChangeSuccess
    with DiagnosticableTreeMixin
    implements PasswordChangeSuccess {
  const _$PasswordChangeSuccess();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState.passwordChangeSuccess()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState.passwordChangeSuccess'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is PasswordChangeSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result avatarChangeLoading(),
    @required Result usernameChangeLoading(),
    @required Result passwordChangeLoading(),
    @required Result deleteAccountLoading(),
    @required Result usernameChangeSuccess(JWT token),
    @required Result passwordChangeSuccess(),
    @required Result avatarChangeSuccess(JWT token),
    @required Result deleteAccountSuccess(),
    @required Result usernameChangeError(AccountFailure failure),
    @required Result passwordChangeError(AccountFailure failure),
    @required Result avatarChangeError(AccountFailure failure),
    @required Result deleteAccountError(AccountFailure failure),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return passwordChangeSuccess();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result avatarChangeLoading(),
    Result usernameChangeLoading(),
    Result passwordChangeLoading(),
    Result deleteAccountLoading(),
    Result usernameChangeSuccess(JWT token),
    Result passwordChangeSuccess(),
    Result avatarChangeSuccess(JWT token),
    Result deleteAccountSuccess(),
    Result usernameChangeError(AccountFailure failure),
    Result passwordChangeError(AccountFailure failure),
    Result avatarChangeError(AccountFailure failure),
    Result deleteAccountError(AccountFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChangeSuccess != null) {
      return passwordChangeSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result avatarChangeLoading(AvatarChangeLoading value),
    @required Result usernameChangeLoading(UsernameChangeLoading value),
    @required Result passwordChangeLoading(PasswordChangeLoading value),
    @required Result deleteAccountLoading(DeleteAccountLoading value),
    @required Result usernameChangeSuccess(UsernameChangeSuccess value),
    @required Result passwordChangeSuccess(PasswordChangeSuccess value),
    @required Result avatarChangeSuccess(AvatarChangeSuccess value),
    @required Result deleteAccountSuccess(DeleteAccountSuccess value),
    @required Result usernameChangeError(UsernameChangeError value),
    @required Result passwordChangeError(PasswordChangeError value),
    @required Result avatarChangeError(AvatarChangeError value),
    @required Result deleteAccountError(DeleteAccountError value),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return passwordChangeSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result avatarChangeLoading(AvatarChangeLoading value),
    Result usernameChangeLoading(UsernameChangeLoading value),
    Result passwordChangeLoading(PasswordChangeLoading value),
    Result deleteAccountLoading(DeleteAccountLoading value),
    Result usernameChangeSuccess(UsernameChangeSuccess value),
    Result passwordChangeSuccess(PasswordChangeSuccess value),
    Result avatarChangeSuccess(AvatarChangeSuccess value),
    Result deleteAccountSuccess(DeleteAccountSuccess value),
    Result usernameChangeError(UsernameChangeError value),
    Result passwordChangeError(PasswordChangeError value),
    Result avatarChangeError(AvatarChangeError value),
    Result deleteAccountError(DeleteAccountError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChangeSuccess != null) {
      return passwordChangeSuccess(this);
    }
    return orElse();
  }
}

abstract class PasswordChangeSuccess implements AccountState {
  const factory PasswordChangeSuccess() = _$PasswordChangeSuccess;
}

abstract class $AvatarChangeSuccessCopyWith<$Res> {
  factory $AvatarChangeSuccessCopyWith(
          AvatarChangeSuccess value, $Res Function(AvatarChangeSuccess) then) =
      _$AvatarChangeSuccessCopyWithImpl<$Res>;
  $Res call({JWT token});
}

class _$AvatarChangeSuccessCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements $AvatarChangeSuccessCopyWith<$Res> {
  _$AvatarChangeSuccessCopyWithImpl(
      AvatarChangeSuccess _value, $Res Function(AvatarChangeSuccess) _then)
      : super(_value, (v) => _then(v as AvatarChangeSuccess));

  @override
  AvatarChangeSuccess get _value => super._value as AvatarChangeSuccess;

  @override
  $Res call({
    Object token = freezed,
  }) {
    return _then(AvatarChangeSuccess(
      token: token == freezed ? _value.token : token as JWT,
    ));
  }
}

class _$AvatarChangeSuccess
    with DiagnosticableTreeMixin
    implements AvatarChangeSuccess {
  const _$AvatarChangeSuccess({@required this.token}) : assert(token != null);

  @override
  final JWT token;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState.avatarChangeSuccess(token: $token)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState.avatarChangeSuccess'))
      ..add(DiagnosticsProperty('token', token));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AvatarChangeSuccess &&
            (identical(other.token, token) ||
                const DeepCollectionEquality().equals(other.token, token)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(token);

  @override
  $AvatarChangeSuccessCopyWith<AvatarChangeSuccess> get copyWith =>
      _$AvatarChangeSuccessCopyWithImpl<AvatarChangeSuccess>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result avatarChangeLoading(),
    @required Result usernameChangeLoading(),
    @required Result passwordChangeLoading(),
    @required Result deleteAccountLoading(),
    @required Result usernameChangeSuccess(JWT token),
    @required Result passwordChangeSuccess(),
    @required Result avatarChangeSuccess(JWT token),
    @required Result deleteAccountSuccess(),
    @required Result usernameChangeError(AccountFailure failure),
    @required Result passwordChangeError(AccountFailure failure),
    @required Result avatarChangeError(AccountFailure failure),
    @required Result deleteAccountError(AccountFailure failure),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return avatarChangeSuccess(token);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result avatarChangeLoading(),
    Result usernameChangeLoading(),
    Result passwordChangeLoading(),
    Result deleteAccountLoading(),
    Result usernameChangeSuccess(JWT token),
    Result passwordChangeSuccess(),
    Result avatarChangeSuccess(JWT token),
    Result deleteAccountSuccess(),
    Result usernameChangeError(AccountFailure failure),
    Result passwordChangeError(AccountFailure failure),
    Result avatarChangeError(AccountFailure failure),
    Result deleteAccountError(AccountFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (avatarChangeSuccess != null) {
      return avatarChangeSuccess(token);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result avatarChangeLoading(AvatarChangeLoading value),
    @required Result usernameChangeLoading(UsernameChangeLoading value),
    @required Result passwordChangeLoading(PasswordChangeLoading value),
    @required Result deleteAccountLoading(DeleteAccountLoading value),
    @required Result usernameChangeSuccess(UsernameChangeSuccess value),
    @required Result passwordChangeSuccess(PasswordChangeSuccess value),
    @required Result avatarChangeSuccess(AvatarChangeSuccess value),
    @required Result deleteAccountSuccess(DeleteAccountSuccess value),
    @required Result usernameChangeError(UsernameChangeError value),
    @required Result passwordChangeError(PasswordChangeError value),
    @required Result avatarChangeError(AvatarChangeError value),
    @required Result deleteAccountError(DeleteAccountError value),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return avatarChangeSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result avatarChangeLoading(AvatarChangeLoading value),
    Result usernameChangeLoading(UsernameChangeLoading value),
    Result passwordChangeLoading(PasswordChangeLoading value),
    Result deleteAccountLoading(DeleteAccountLoading value),
    Result usernameChangeSuccess(UsernameChangeSuccess value),
    Result passwordChangeSuccess(PasswordChangeSuccess value),
    Result avatarChangeSuccess(AvatarChangeSuccess value),
    Result deleteAccountSuccess(DeleteAccountSuccess value),
    Result usernameChangeError(UsernameChangeError value),
    Result passwordChangeError(PasswordChangeError value),
    Result avatarChangeError(AvatarChangeError value),
    Result deleteAccountError(DeleteAccountError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (avatarChangeSuccess != null) {
      return avatarChangeSuccess(this);
    }
    return orElse();
  }
}

abstract class AvatarChangeSuccess implements AccountState {
  const factory AvatarChangeSuccess({@required JWT token}) =
      _$AvatarChangeSuccess;

  JWT get token;
  $AvatarChangeSuccessCopyWith<AvatarChangeSuccess> get copyWith;
}

abstract class $DeleteAccountSuccessCopyWith<$Res> {
  factory $DeleteAccountSuccessCopyWith(DeleteAccountSuccess value,
          $Res Function(DeleteAccountSuccess) then) =
      _$DeleteAccountSuccessCopyWithImpl<$Res>;
}

class _$DeleteAccountSuccessCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements $DeleteAccountSuccessCopyWith<$Res> {
  _$DeleteAccountSuccessCopyWithImpl(
      DeleteAccountSuccess _value, $Res Function(DeleteAccountSuccess) _then)
      : super(_value, (v) => _then(v as DeleteAccountSuccess));

  @override
  DeleteAccountSuccess get _value => super._value as DeleteAccountSuccess;
}

class _$DeleteAccountSuccess
    with DiagnosticableTreeMixin
    implements DeleteAccountSuccess {
  const _$DeleteAccountSuccess();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState.deleteAccountSuccess()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState.deleteAccountSuccess'));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) || (other is DeleteAccountSuccess);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result avatarChangeLoading(),
    @required Result usernameChangeLoading(),
    @required Result passwordChangeLoading(),
    @required Result deleteAccountLoading(),
    @required Result usernameChangeSuccess(JWT token),
    @required Result passwordChangeSuccess(),
    @required Result avatarChangeSuccess(JWT token),
    @required Result deleteAccountSuccess(),
    @required Result usernameChangeError(AccountFailure failure),
    @required Result passwordChangeError(AccountFailure failure),
    @required Result avatarChangeError(AccountFailure failure),
    @required Result deleteAccountError(AccountFailure failure),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return deleteAccountSuccess();
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result avatarChangeLoading(),
    Result usernameChangeLoading(),
    Result passwordChangeLoading(),
    Result deleteAccountLoading(),
    Result usernameChangeSuccess(JWT token),
    Result passwordChangeSuccess(),
    Result avatarChangeSuccess(JWT token),
    Result deleteAccountSuccess(),
    Result usernameChangeError(AccountFailure failure),
    Result passwordChangeError(AccountFailure failure),
    Result avatarChangeError(AccountFailure failure),
    Result deleteAccountError(AccountFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteAccountSuccess != null) {
      return deleteAccountSuccess();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result avatarChangeLoading(AvatarChangeLoading value),
    @required Result usernameChangeLoading(UsernameChangeLoading value),
    @required Result passwordChangeLoading(PasswordChangeLoading value),
    @required Result deleteAccountLoading(DeleteAccountLoading value),
    @required Result usernameChangeSuccess(UsernameChangeSuccess value),
    @required Result passwordChangeSuccess(PasswordChangeSuccess value),
    @required Result avatarChangeSuccess(AvatarChangeSuccess value),
    @required Result deleteAccountSuccess(DeleteAccountSuccess value),
    @required Result usernameChangeError(UsernameChangeError value),
    @required Result passwordChangeError(PasswordChangeError value),
    @required Result avatarChangeError(AvatarChangeError value),
    @required Result deleteAccountError(DeleteAccountError value),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return deleteAccountSuccess(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result avatarChangeLoading(AvatarChangeLoading value),
    Result usernameChangeLoading(UsernameChangeLoading value),
    Result passwordChangeLoading(PasswordChangeLoading value),
    Result deleteAccountLoading(DeleteAccountLoading value),
    Result usernameChangeSuccess(UsernameChangeSuccess value),
    Result passwordChangeSuccess(PasswordChangeSuccess value),
    Result avatarChangeSuccess(AvatarChangeSuccess value),
    Result deleteAccountSuccess(DeleteAccountSuccess value),
    Result usernameChangeError(UsernameChangeError value),
    Result passwordChangeError(PasswordChangeError value),
    Result avatarChangeError(AvatarChangeError value),
    Result deleteAccountError(DeleteAccountError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteAccountSuccess != null) {
      return deleteAccountSuccess(this);
    }
    return orElse();
  }
}

abstract class DeleteAccountSuccess implements AccountState {
  const factory DeleteAccountSuccess() = _$DeleteAccountSuccess;
}

abstract class $UsernameChangeErrorCopyWith<$Res> {
  factory $UsernameChangeErrorCopyWith(
          UsernameChangeError value, $Res Function(UsernameChangeError) then) =
      _$UsernameChangeErrorCopyWithImpl<$Res>;
  $Res call({AccountFailure failure});

  $AccountFailureCopyWith<$Res> get failure;
}

class _$UsernameChangeErrorCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements $UsernameChangeErrorCopyWith<$Res> {
  _$UsernameChangeErrorCopyWithImpl(
      UsernameChangeError _value, $Res Function(UsernameChangeError) _then)
      : super(_value, (v) => _then(v as UsernameChangeError));

  @override
  UsernameChangeError get _value => super._value as UsernameChangeError;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(UsernameChangeError(
      failure: failure == freezed ? _value.failure : failure as AccountFailure,
    ));
  }

  @override
  $AccountFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $AccountFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

class _$UsernameChangeError
    with DiagnosticableTreeMixin
    implements UsernameChangeError {
  const _$UsernameChangeError({@required this.failure})
      : assert(failure != null);

  @override
  final AccountFailure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState.usernameChangeError(failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState.usernameChangeError'))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is UsernameChangeError &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $UsernameChangeErrorCopyWith<UsernameChangeError> get copyWith =>
      _$UsernameChangeErrorCopyWithImpl<UsernameChangeError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result avatarChangeLoading(),
    @required Result usernameChangeLoading(),
    @required Result passwordChangeLoading(),
    @required Result deleteAccountLoading(),
    @required Result usernameChangeSuccess(JWT token),
    @required Result passwordChangeSuccess(),
    @required Result avatarChangeSuccess(JWT token),
    @required Result deleteAccountSuccess(),
    @required Result usernameChangeError(AccountFailure failure),
    @required Result passwordChangeError(AccountFailure failure),
    @required Result avatarChangeError(AccountFailure failure),
    @required Result deleteAccountError(AccountFailure failure),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return usernameChangeError(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result avatarChangeLoading(),
    Result usernameChangeLoading(),
    Result passwordChangeLoading(),
    Result deleteAccountLoading(),
    Result usernameChangeSuccess(JWT token),
    Result passwordChangeSuccess(),
    Result avatarChangeSuccess(JWT token),
    Result deleteAccountSuccess(),
    Result usernameChangeError(AccountFailure failure),
    Result passwordChangeError(AccountFailure failure),
    Result avatarChangeError(AccountFailure failure),
    Result deleteAccountError(AccountFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (usernameChangeError != null) {
      return usernameChangeError(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result avatarChangeLoading(AvatarChangeLoading value),
    @required Result usernameChangeLoading(UsernameChangeLoading value),
    @required Result passwordChangeLoading(PasswordChangeLoading value),
    @required Result deleteAccountLoading(DeleteAccountLoading value),
    @required Result usernameChangeSuccess(UsernameChangeSuccess value),
    @required Result passwordChangeSuccess(PasswordChangeSuccess value),
    @required Result avatarChangeSuccess(AvatarChangeSuccess value),
    @required Result deleteAccountSuccess(DeleteAccountSuccess value),
    @required Result usernameChangeError(UsernameChangeError value),
    @required Result passwordChangeError(PasswordChangeError value),
    @required Result avatarChangeError(AvatarChangeError value),
    @required Result deleteAccountError(DeleteAccountError value),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return usernameChangeError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result avatarChangeLoading(AvatarChangeLoading value),
    Result usernameChangeLoading(UsernameChangeLoading value),
    Result passwordChangeLoading(PasswordChangeLoading value),
    Result deleteAccountLoading(DeleteAccountLoading value),
    Result usernameChangeSuccess(UsernameChangeSuccess value),
    Result passwordChangeSuccess(PasswordChangeSuccess value),
    Result avatarChangeSuccess(AvatarChangeSuccess value),
    Result deleteAccountSuccess(DeleteAccountSuccess value),
    Result usernameChangeError(UsernameChangeError value),
    Result passwordChangeError(PasswordChangeError value),
    Result avatarChangeError(AvatarChangeError value),
    Result deleteAccountError(DeleteAccountError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (usernameChangeError != null) {
      return usernameChangeError(this);
    }
    return orElse();
  }
}

abstract class UsernameChangeError implements AccountState {
  const factory UsernameChangeError({@required AccountFailure failure}) =
      _$UsernameChangeError;

  AccountFailure get failure;
  $UsernameChangeErrorCopyWith<UsernameChangeError> get copyWith;
}

abstract class $PasswordChangeErrorCopyWith<$Res> {
  factory $PasswordChangeErrorCopyWith(
          PasswordChangeError value, $Res Function(PasswordChangeError) then) =
      _$PasswordChangeErrorCopyWithImpl<$Res>;
  $Res call({AccountFailure failure});

  $AccountFailureCopyWith<$Res> get failure;
}

class _$PasswordChangeErrorCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements $PasswordChangeErrorCopyWith<$Res> {
  _$PasswordChangeErrorCopyWithImpl(
      PasswordChangeError _value, $Res Function(PasswordChangeError) _then)
      : super(_value, (v) => _then(v as PasswordChangeError));

  @override
  PasswordChangeError get _value => super._value as PasswordChangeError;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(PasswordChangeError(
      failure: failure == freezed ? _value.failure : failure as AccountFailure,
    ));
  }

  @override
  $AccountFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $AccountFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

class _$PasswordChangeError
    with DiagnosticableTreeMixin
    implements PasswordChangeError {
  const _$PasswordChangeError({@required this.failure})
      : assert(failure != null);

  @override
  final AccountFailure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState.passwordChangeError(failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState.passwordChangeError'))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is PasswordChangeError &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $PasswordChangeErrorCopyWith<PasswordChangeError> get copyWith =>
      _$PasswordChangeErrorCopyWithImpl<PasswordChangeError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result avatarChangeLoading(),
    @required Result usernameChangeLoading(),
    @required Result passwordChangeLoading(),
    @required Result deleteAccountLoading(),
    @required Result usernameChangeSuccess(JWT token),
    @required Result passwordChangeSuccess(),
    @required Result avatarChangeSuccess(JWT token),
    @required Result deleteAccountSuccess(),
    @required Result usernameChangeError(AccountFailure failure),
    @required Result passwordChangeError(AccountFailure failure),
    @required Result avatarChangeError(AccountFailure failure),
    @required Result deleteAccountError(AccountFailure failure),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return passwordChangeError(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result avatarChangeLoading(),
    Result usernameChangeLoading(),
    Result passwordChangeLoading(),
    Result deleteAccountLoading(),
    Result usernameChangeSuccess(JWT token),
    Result passwordChangeSuccess(),
    Result avatarChangeSuccess(JWT token),
    Result deleteAccountSuccess(),
    Result usernameChangeError(AccountFailure failure),
    Result passwordChangeError(AccountFailure failure),
    Result avatarChangeError(AccountFailure failure),
    Result deleteAccountError(AccountFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChangeError != null) {
      return passwordChangeError(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result avatarChangeLoading(AvatarChangeLoading value),
    @required Result usernameChangeLoading(UsernameChangeLoading value),
    @required Result passwordChangeLoading(PasswordChangeLoading value),
    @required Result deleteAccountLoading(DeleteAccountLoading value),
    @required Result usernameChangeSuccess(UsernameChangeSuccess value),
    @required Result passwordChangeSuccess(PasswordChangeSuccess value),
    @required Result avatarChangeSuccess(AvatarChangeSuccess value),
    @required Result deleteAccountSuccess(DeleteAccountSuccess value),
    @required Result usernameChangeError(UsernameChangeError value),
    @required Result passwordChangeError(PasswordChangeError value),
    @required Result avatarChangeError(AvatarChangeError value),
    @required Result deleteAccountError(DeleteAccountError value),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return passwordChangeError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result avatarChangeLoading(AvatarChangeLoading value),
    Result usernameChangeLoading(UsernameChangeLoading value),
    Result passwordChangeLoading(PasswordChangeLoading value),
    Result deleteAccountLoading(DeleteAccountLoading value),
    Result usernameChangeSuccess(UsernameChangeSuccess value),
    Result passwordChangeSuccess(PasswordChangeSuccess value),
    Result avatarChangeSuccess(AvatarChangeSuccess value),
    Result deleteAccountSuccess(DeleteAccountSuccess value),
    Result usernameChangeError(UsernameChangeError value),
    Result passwordChangeError(PasswordChangeError value),
    Result avatarChangeError(AvatarChangeError value),
    Result deleteAccountError(DeleteAccountError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (passwordChangeError != null) {
      return passwordChangeError(this);
    }
    return orElse();
  }
}

abstract class PasswordChangeError implements AccountState {
  const factory PasswordChangeError({@required AccountFailure failure}) =
      _$PasswordChangeError;

  AccountFailure get failure;
  $PasswordChangeErrorCopyWith<PasswordChangeError> get copyWith;
}

abstract class $AvatarChangeErrorCopyWith<$Res> {
  factory $AvatarChangeErrorCopyWith(
          AvatarChangeError value, $Res Function(AvatarChangeError) then) =
      _$AvatarChangeErrorCopyWithImpl<$Res>;
  $Res call({AccountFailure failure});

  $AccountFailureCopyWith<$Res> get failure;
}

class _$AvatarChangeErrorCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements $AvatarChangeErrorCopyWith<$Res> {
  _$AvatarChangeErrorCopyWithImpl(
      AvatarChangeError _value, $Res Function(AvatarChangeError) _then)
      : super(_value, (v) => _then(v as AvatarChangeError));

  @override
  AvatarChangeError get _value => super._value as AvatarChangeError;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(AvatarChangeError(
      failure: failure == freezed ? _value.failure : failure as AccountFailure,
    ));
  }

  @override
  $AccountFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $AccountFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

class _$AvatarChangeError
    with DiagnosticableTreeMixin
    implements AvatarChangeError {
  const _$AvatarChangeError({@required this.failure}) : assert(failure != null);

  @override
  final AccountFailure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState.avatarChangeError(failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState.avatarChangeError'))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is AvatarChangeError &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $AvatarChangeErrorCopyWith<AvatarChangeError> get copyWith =>
      _$AvatarChangeErrorCopyWithImpl<AvatarChangeError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result avatarChangeLoading(),
    @required Result usernameChangeLoading(),
    @required Result passwordChangeLoading(),
    @required Result deleteAccountLoading(),
    @required Result usernameChangeSuccess(JWT token),
    @required Result passwordChangeSuccess(),
    @required Result avatarChangeSuccess(JWT token),
    @required Result deleteAccountSuccess(),
    @required Result usernameChangeError(AccountFailure failure),
    @required Result passwordChangeError(AccountFailure failure),
    @required Result avatarChangeError(AccountFailure failure),
    @required Result deleteAccountError(AccountFailure failure),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return avatarChangeError(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result avatarChangeLoading(),
    Result usernameChangeLoading(),
    Result passwordChangeLoading(),
    Result deleteAccountLoading(),
    Result usernameChangeSuccess(JWT token),
    Result passwordChangeSuccess(),
    Result avatarChangeSuccess(JWT token),
    Result deleteAccountSuccess(),
    Result usernameChangeError(AccountFailure failure),
    Result passwordChangeError(AccountFailure failure),
    Result avatarChangeError(AccountFailure failure),
    Result deleteAccountError(AccountFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (avatarChangeError != null) {
      return avatarChangeError(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result avatarChangeLoading(AvatarChangeLoading value),
    @required Result usernameChangeLoading(UsernameChangeLoading value),
    @required Result passwordChangeLoading(PasswordChangeLoading value),
    @required Result deleteAccountLoading(DeleteAccountLoading value),
    @required Result usernameChangeSuccess(UsernameChangeSuccess value),
    @required Result passwordChangeSuccess(PasswordChangeSuccess value),
    @required Result avatarChangeSuccess(AvatarChangeSuccess value),
    @required Result deleteAccountSuccess(DeleteAccountSuccess value),
    @required Result usernameChangeError(UsernameChangeError value),
    @required Result passwordChangeError(PasswordChangeError value),
    @required Result avatarChangeError(AvatarChangeError value),
    @required Result deleteAccountError(DeleteAccountError value),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return avatarChangeError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result avatarChangeLoading(AvatarChangeLoading value),
    Result usernameChangeLoading(UsernameChangeLoading value),
    Result passwordChangeLoading(PasswordChangeLoading value),
    Result deleteAccountLoading(DeleteAccountLoading value),
    Result usernameChangeSuccess(UsernameChangeSuccess value),
    Result passwordChangeSuccess(PasswordChangeSuccess value),
    Result avatarChangeSuccess(AvatarChangeSuccess value),
    Result deleteAccountSuccess(DeleteAccountSuccess value),
    Result usernameChangeError(UsernameChangeError value),
    Result passwordChangeError(PasswordChangeError value),
    Result avatarChangeError(AvatarChangeError value),
    Result deleteAccountError(DeleteAccountError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (avatarChangeError != null) {
      return avatarChangeError(this);
    }
    return orElse();
  }
}

abstract class AvatarChangeError implements AccountState {
  const factory AvatarChangeError({@required AccountFailure failure}) =
      _$AvatarChangeError;

  AccountFailure get failure;
  $AvatarChangeErrorCopyWith<AvatarChangeError> get copyWith;
}

abstract class $DeleteAccountErrorCopyWith<$Res> {
  factory $DeleteAccountErrorCopyWith(
          DeleteAccountError value, $Res Function(DeleteAccountError) then) =
      _$DeleteAccountErrorCopyWithImpl<$Res>;
  $Res call({AccountFailure failure});

  $AccountFailureCopyWith<$Res> get failure;
}

class _$DeleteAccountErrorCopyWithImpl<$Res>
    extends _$AccountStateCopyWithImpl<$Res>
    implements $DeleteAccountErrorCopyWith<$Res> {
  _$DeleteAccountErrorCopyWithImpl(
      DeleteAccountError _value, $Res Function(DeleteAccountError) _then)
      : super(_value, (v) => _then(v as DeleteAccountError));

  @override
  DeleteAccountError get _value => super._value as DeleteAccountError;

  @override
  $Res call({
    Object failure = freezed,
  }) {
    return _then(DeleteAccountError(
      failure: failure == freezed ? _value.failure : failure as AccountFailure,
    ));
  }

  @override
  $AccountFailureCopyWith<$Res> get failure {
    if (_value.failure == null) {
      return null;
    }
    return $AccountFailureCopyWith<$Res>(_value.failure, (value) {
      return _then(_value.copyWith(failure: value));
    });
  }
}

class _$DeleteAccountError
    with DiagnosticableTreeMixin
    implements DeleteAccountError {
  const _$DeleteAccountError({@required this.failure})
      : assert(failure != null);

  @override
  final AccountFailure failure;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AccountState.deleteAccountError(failure: $failure)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AccountState.deleteAccountError'))
      ..add(DiagnosticsProperty('failure', failure));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is DeleteAccountError &&
            (identical(other.failure, failure) ||
                const DeepCollectionEquality().equals(other.failure, failure)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^ const DeepCollectionEquality().hash(failure);

  @override
  $DeleteAccountErrorCopyWith<DeleteAccountError> get copyWith =>
      _$DeleteAccountErrorCopyWithImpl<DeleteAccountError>(this, _$identity);

  @override
  @optionalTypeArgs
  Result when<Result extends Object>({
    @required Result initial(),
    @required Result avatarChangeLoading(),
    @required Result usernameChangeLoading(),
    @required Result passwordChangeLoading(),
    @required Result deleteAccountLoading(),
    @required Result usernameChangeSuccess(JWT token),
    @required Result passwordChangeSuccess(),
    @required Result avatarChangeSuccess(JWT token),
    @required Result deleteAccountSuccess(),
    @required Result usernameChangeError(AccountFailure failure),
    @required Result passwordChangeError(AccountFailure failure),
    @required Result avatarChangeError(AccountFailure failure),
    @required Result deleteAccountError(AccountFailure failure),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return deleteAccountError(failure);
  }

  @override
  @optionalTypeArgs
  Result maybeWhen<Result extends Object>({
    Result initial(),
    Result avatarChangeLoading(),
    Result usernameChangeLoading(),
    Result passwordChangeLoading(),
    Result deleteAccountLoading(),
    Result usernameChangeSuccess(JWT token),
    Result passwordChangeSuccess(),
    Result avatarChangeSuccess(JWT token),
    Result deleteAccountSuccess(),
    Result usernameChangeError(AccountFailure failure),
    Result passwordChangeError(AccountFailure failure),
    Result avatarChangeError(AccountFailure failure),
    Result deleteAccountError(AccountFailure failure),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteAccountError != null) {
      return deleteAccountError(failure);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  Result map<Result extends Object>({
    @required Result initial(Initial value),
    @required Result avatarChangeLoading(AvatarChangeLoading value),
    @required Result usernameChangeLoading(UsernameChangeLoading value),
    @required Result passwordChangeLoading(PasswordChangeLoading value),
    @required Result deleteAccountLoading(DeleteAccountLoading value),
    @required Result usernameChangeSuccess(UsernameChangeSuccess value),
    @required Result passwordChangeSuccess(PasswordChangeSuccess value),
    @required Result avatarChangeSuccess(AvatarChangeSuccess value),
    @required Result deleteAccountSuccess(DeleteAccountSuccess value),
    @required Result usernameChangeError(UsernameChangeError value),
    @required Result passwordChangeError(PasswordChangeError value),
    @required Result avatarChangeError(AvatarChangeError value),
    @required Result deleteAccountError(DeleteAccountError value),
  }) {
    assert(initial != null);
    assert(avatarChangeLoading != null);
    assert(usernameChangeLoading != null);
    assert(passwordChangeLoading != null);
    assert(deleteAccountLoading != null);
    assert(usernameChangeSuccess != null);
    assert(passwordChangeSuccess != null);
    assert(avatarChangeSuccess != null);
    assert(deleteAccountSuccess != null);
    assert(usernameChangeError != null);
    assert(passwordChangeError != null);
    assert(avatarChangeError != null);
    assert(deleteAccountError != null);
    return deleteAccountError(this);
  }

  @override
  @optionalTypeArgs
  Result maybeMap<Result extends Object>({
    Result initial(Initial value),
    Result avatarChangeLoading(AvatarChangeLoading value),
    Result usernameChangeLoading(UsernameChangeLoading value),
    Result passwordChangeLoading(PasswordChangeLoading value),
    Result deleteAccountLoading(DeleteAccountLoading value),
    Result usernameChangeSuccess(UsernameChangeSuccess value),
    Result passwordChangeSuccess(PasswordChangeSuccess value),
    Result avatarChangeSuccess(AvatarChangeSuccess value),
    Result deleteAccountSuccess(DeleteAccountSuccess value),
    Result usernameChangeError(UsernameChangeError value),
    Result passwordChangeError(PasswordChangeError value),
    Result avatarChangeError(AvatarChangeError value),
    Result deleteAccountError(DeleteAccountError value),
    @required Result orElse(),
  }) {
    assert(orElse != null);
    if (deleteAccountError != null) {
      return deleteAccountError(this);
    }
    return orElse();
  }
}

abstract class DeleteAccountError implements AccountState {
  const factory DeleteAccountError({@required AccountFailure failure}) =
      _$DeleteAccountError;

  AccountFailure get failure;
  $DeleteAccountErrorCopyWith<DeleteAccountError> get copyWith;
}
