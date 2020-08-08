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

/// The BLoC that is reponsible for handling the login form events.
///
/// Maps incoming [LoginFormEvent] to [LoginFormState].
@injectable
class LoginFormBloc extends Bloc<LoginFormEvent, LoginFormState> {
  final IAuthRepository _authClient;

  LoginFormBloc(this._authClient) : super(LoginFormState.initial());

  // Event handlers transform events->state and passes it back to the UI
  @override
  Stream<LoginFormState> mapEventToState(
    LoginFormEvent event,
  ) async* {
    yield* event.map(
      usernameChanged: (e) async* {
        yield* _mapUsernameChangedToState(e.usernameStr);
      },
      passwordChanged: (e) async* {
        yield* _mapPasswordChangedToState(e.passwordStr);
      },
      loginPressed: (e) async* {
        yield* _mapLoginPressedToState();
      },
    );
  }

  Stream<LoginFormState> _mapUsernameChangedToState(String usernameStr) async* {
    yield state.copyWith(
        username: Username(usernameStr), authFailureOrSuccessOption: none());
  }

  Stream<LoginFormState> _mapPasswordChangedToState(String passwordStr) async* {
    yield state.copyWith(
        password: Password(passwordStr), authFailureOrSuccessOption: none());
  }

  Stream<LoginFormState> _mapLoginPressedToState() async* {
    Either<LoginFailure, JWT> result;

    final isPasswordValid = state.password.isValid();
    final isUsernameValid = state.username.isValid();

    if (isPasswordValid && isUsernameValid) {
      // In progress
      yield state.copyWith(
          isSubmitting: true, authFailureOrSuccessOption: none());

      // Attempt to login
      result = await _authClient.login(
          password: state.password, username: state.username);
    }
    // Nonvalid input
    yield state.copyWith(
      isSubmitting: false,
      authFailureOrSuccessOption: optionOf(result),
      showErrorMessages: true,
    );
  }
}
