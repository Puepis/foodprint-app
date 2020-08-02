part of 'login_form_bloc.dart';

// This class represents the state of the login page
@freezed 
abstract class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    @required Username username,
    @required Password password,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required Option<Either<LoginFailure, JWT>> authFailureOrSuccessOption, // nothing happened yet
  }) = _LoginFormState;

  factory LoginFormState.initial() => LoginFormState(
    username: Username(''),
    password: Password(''),
    showErrorMessages: false,
    isSubmitting: false,
    authFailureOrSuccessOption: none()
  );
}