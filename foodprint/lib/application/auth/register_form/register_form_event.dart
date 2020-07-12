part of 'register_form_bloc.dart';

@freezed
abstract class RegisterFormEvent with _$RegisterFormEvent {
  const factory RegisterFormEvent.usernameChanged(String usernameStr) =
      UsernameChanged;
  const factory RegisterFormEvent.passwordChanged(String passwordStr) =
      PasswordChanged;
  const factory RegisterFormEvent.confirmationPasswordChanged(
      String confirmationStr) = ConfirmationPasswordChanged;
  const factory RegisterFormEvent.registerPressed() = RegisterPressed;
}
