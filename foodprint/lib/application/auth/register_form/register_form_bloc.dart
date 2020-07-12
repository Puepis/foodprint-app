import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/auth/i_auth_repository.dart';
import 'package:foodprint/domain/auth/register_failure.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'register_form_event.dart';
part 'register_form_state.dart';

part 'register_form_bloc.freezed.dart';

@injectable
class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  final IAuthRepository _authClient;

  RegisterFormBloc(this._authClient);

  @override
  RegisterFormState get initialState => RegisterFormState.initial();

  @override
  Stream<RegisterFormState> mapEventToState(
    RegisterFormEvent event,
  ) async* {
    yield* event.map(
      usernameChanged: (e) async* {
        yield state.copyWith(
            username: Username(e.usernameStr),
            authFailureOrSuccessOption: none());
      },
      passwordChanged: (e) async* {
        yield state.copyWith(
            password: Password(e.passwordStr),
            passwordsMatch: e.passwordStr
                    .compareTo(state.confirmationPassword.getOrCrash()) ==
                0,
            authFailureOrSuccessOption: none());
      },
      confirmationPasswordChanged: (e) async* {
        if (state.password.isValid()) {
          final bool match =
              state.password.getOrCrash().compareTo(e.confirmationStr) == 0;
          yield state.copyWith(
              confirmationPassword: ConfirmationPassword(e.confirmationStr),
              passwordsMatch: match,
              authFailureOrSuccessOption: none());
        } else {
          yield state.copyWith(
              confirmationPassword: ConfirmationPassword(e.confirmationStr),
              // The passwords can't be compared so don't display error
              passwordsMatch: true,
              authFailureOrSuccessOption: none());
        }
      },
      registerPressed: (e) async* {
        Either<RegisterFailure, Unit> failureOrSuccess;

        // Check if the fields are valid
        final isPasswordValid = state.password.isValid();
        final isUsernameValid = state.username.isValid();

        if (isPasswordValid && isUsernameValid && state.passwordsMatch) {
          yield state.copyWith(
              isSubmitting: true, authFailureOrSuccessOption: none());

          // Attempt to register
          failureOrSuccess = await _authClient.register(
              password: state.password, username: state.username);
        }
        // Invalid input
        yield state.copyWith(
          isSubmitting: false,
          authFailureOrSuccessOption: optionOf(
              failureOrSuccess), // if null, return none() otherwise some(failureOrSuccess)
          showErrorMessages: true,
        );
      },
    );
  }
}
