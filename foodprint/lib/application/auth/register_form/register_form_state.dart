part of 'register_form_bloc.dart';

@freezed 
abstract class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    @required EmailAddress emailAddress,
    @required Username username,
    @required Password password,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required Option<Either<RegisterFailure, Unit>> authFailureOrSuccessOption, // nothing happened yet
  }) = _RegisterFormState;

  factory RegisterFormState.initial() => RegisterFormState(
    emailAddress: EmailAddress(''),
    username: Username(''),
    password: Password(''),
    showErrorMessages: false,
    isSubmitting: false,
    authFailureOrSuccessOption: none()
  );
}