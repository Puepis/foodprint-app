part of 'login_form_bloc.dart';

@freezed 
abstract class LoginFormState with _$LoginFormState {
  const factory LoginFormState({
    @required Username username,
    @required Password password,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required Option<Either<LoginFailure, Unit>> authFailureOrSuccessOption, // nothing happened yet
  }) = _LoginFormState;

  factory LoginFormState.initial() => LoginFormState(
    username: Username(''),
    password: Password(''),
    showErrorMessages: false,
    isSubmitting: false,
    authFailureOrSuccessOption: none()
  );
}