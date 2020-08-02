part of 'login_form_bloc.dart';

@freezed
abstract class LoginFormEvent with _$LoginFormEvent {
  const factory LoginFormEvent.usernameChanged(String usernameStr) =
      UsernameChanged;
  const factory LoginFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory LoginFormEvent.loginPressed() =
      LoginWithEmailAndPasswordPressed;
}