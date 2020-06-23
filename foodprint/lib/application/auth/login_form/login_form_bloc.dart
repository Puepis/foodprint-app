import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/rendering.dart';
import 'package:foodprint/domain/auth/i_auth_repository.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/auth/login_failure.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';

part 'login_form_event.dart';
part 'login_form_state.dart';

part 'login_form_bloc.freezed.dart';

// This is the business logic component (BLoC) for the login page

// In this application layer we decide how the data flows: in this case we redirect the 
// login data to the authFacade
@injectable
class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final IAuthRepository _authClient;

  LoginFormBloc(this._authClient);

  @override
  LoginFormState get initialState => LoginFormState.initial();

  // Event handlers transform events->state and passes it back to the UI
  @override
  Stream<LoginFormState> mapEventToState(
    LoginFormEvent event,
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
            authFailureOrSuccessOption: none());
      },
      loginPressed: (e) async* {
        Either<LoginFailure, JWT> failureOrSuccess;

        final isPasswordValid = state.password.isValid();
        final isUsernameValid = state.username.isValid();

        if (isPasswordValid && isUsernameValid) {
          yield state.copyWith(
              isSubmitting: true, authFailureOrSuccessOption: none());

          // Attempt to login
          failureOrSuccess = await _authClient.login(
              password: state.password, username: state.username);
        }
        // Nonvalid input
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
