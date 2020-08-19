import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodprint/domain/auth/i_auth_repository.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/core/exceptions.dart';
import 'package:foodprint/infrastructure/local_storage/onboarding_client.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

/// BloC responsible for handling user authencation state.
///
/// Maps incoming [AuthEvent] to [AuthState].
@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authClient;
  final OnboardingClient _onboardingClient =
      OnboardingClient(const FlutterSecureStorage());

  AuthBloc(this._authClient) : super(const AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(
      authCheckStarted: (e) async* {
        final Option<JWT> result = await _authClient.getAccessToken();
        if (result.isSome()) {
          yield AuthState.authenticated(token: result.getOrElse(() => null));
        } else {
          try {
            await _onboardingClient.getAppLaunched();
            yield const AuthState.unauthenticated();
          } on NotPreviouslyLaunchedException {
            await _onboardingClient.markAppLaunched();
            yield const AuthState.firstAppLaunch();
          }
        }
      },
      loggedIn: (e) async* {
        yield const AuthState.loading();
        yield AuthState.authenticated(token: e.token);
      },
      loggedOut: (e) async* {
        await _authClient.logout();
        yield const AuthState.unauthenticated(); // user logged out
      },
    );
  }
}
