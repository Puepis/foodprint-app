part of 'auth_bloc.dart';

@freezed
abstract class AuthState with _$AuthState {
  const factory AuthState.initial() = Initial;
  const factory AuthState.authenticated({@required JWT token}) = Authenticated;
  const factory AuthState.unauthenticated() = Unauthenticated;
  const factory AuthState.firstAppLaunch() = FirstAppLaunch;
  const factory AuthState.loading() = Loading;
}
