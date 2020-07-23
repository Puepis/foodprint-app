part of 'auth_bloc.dart';

@freezed
abstract class AuthEvent with _$AuthEvent {
  const factory AuthEvent.authCheckStarted() = AuthCheckStarted;
  const factory AuthEvent.loggedIn({@required JWT token}) = LoggedIn;
  const factory AuthEvent.loggedOut() = LoggedOut;
  const factory AuthEvent.refreshAccount({@required JWT token}) =
      RefreshAccount;
}
