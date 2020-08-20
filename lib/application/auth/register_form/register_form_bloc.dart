import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/auth/i_auth_repository.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/auth/register_failure.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'register_form_event.dart';
part 'register_form_state.dart';

part 'register_form_bloc.freezed.dart';

/// The BLoC that is reponsible for handling the register form events.
///
/// Maps incoming [RegisterFormEvent] to [RegisterFormState].
@injectable
class RegisterFormBloc extends Bloc<RegisterFormEvent, RegisterFormState> {
  final IAuthRepository _authClient;

  RegisterFormBloc(this._authClient) : super(RegisterFormState.initial());

  @override
  Stream<RegisterFormState> mapEventToState(
    RegisterFormEvent event,
  ) async* {
    yield* event.map(
      usernameChanged: (e) async* {
        yield* _mapUsernameChangedToState(e.usernameStr);
      },
      passwordChanged: (e) async* {
        yield* _mapPasswordChangedToState(e.passwordStr);
      },
      confirmationPasswordChanged: (e) async* {
        yield* _mapConfirmationPasswordChangedToState(e.confirmationStr);
      },
      registerPressed: (e) async* {
        yield* _mapRegisterPressedToState();
      },
    );
  }

  Stream<RegisterFormState> _mapUsernameChangedToState(
      String usernameStr) async* {
    yield state.copyWith(
        username: Username(usernameStr), registerOption: none());
  }

  Stream<RegisterFormState> _mapPasswordChangedToState(
      String passwordStr) async* {
    yield state.copyWith(
        password: Password(passwordStr),
        passwordsMatch:
            passwordStr.compareTo(state.confirmationPassword.getOrCrash()) == 0,
        registerOption: none());
  }

  Stream<RegisterFormState> _mapConfirmationPasswordChangedToState(
      String confirmationStr) async* {
    if (state.password.isValid()) {
      final bool match =
          state.password.getOrCrash().compareTo(confirmationStr) == 0;
      yield state.copyWith(
          confirmationPassword: ConfirmationPassword(confirmationStr),
          passwordsMatch: match,
          registerOption: none());
    } else {
      yield state.copyWith(
          confirmationPassword: ConfirmationPassword(confirmationStr),
          // The passwords can't be compared so don't display error
          passwordsMatch: true,
          registerOption: none());
    }
  }

  Stream<RegisterFormState> _mapRegisterPressedToState() async* {
    bool failed = false;
    Either<RegisterFailure, JWT> finalResult;

    // Check if the fields are valid
    final isPasswordValid = state.password.isValid();
    final isUsernameValid = state.username.isValid();

    if (isPasswordValid && isUsernameValid && state.passwordsMatch) {
      yield state.copyWith(isSubmitting: true, registerOption: none());

      // Attempt to register
      final Either<RegisterFailure, Unit> registerResult = await _authClient
          .register(password: state.password, username: state.username);

      registerResult.fold((failure) {
        failed = true;
        finalResult = left(failure);
      }, (r) {});

      // Log in user after registration successful
      if (!failed) {
        final loginResult = await _authClient.login(
            password: state.password, username: state.username);
        loginResult.fold((l) => null, (r) => finalResult = right(r));
      }
    }
    // Invalid input
    yield state.copyWith(
      isSubmitting: false,
      registerOption: optionOf(
          finalResult), // if null, return none() otherwise some(failureOrSuccess)
      showErrorMessages: true,
    );
  }
}
