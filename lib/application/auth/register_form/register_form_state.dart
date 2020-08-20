part of 'register_form_bloc.dart';

@freezed
abstract class RegisterFormState with _$RegisterFormState {
  const factory RegisterFormState({
    @required Username username,
    @required Password password,
    @required ConfirmationPassword confirmationPassword,
    @required bool passwordsMatch,
    @required bool showErrorMessages,
    @required bool isSubmitting,
    @required
        Option<Either<RegisterFailure, JWT>>
            registerOption, // nothing happened yet
  }) = _RegisterFormState;

  factory RegisterFormState.initial() => RegisterFormState(
      username: Username(''),
      password: Password(''),
      confirmationPassword: ConfirmationPassword(''),
      showErrorMessages: false,
      isSubmitting: false,
      registerOption: none(),
      passwordsMatch: true);
}
