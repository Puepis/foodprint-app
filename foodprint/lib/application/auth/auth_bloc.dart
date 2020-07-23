import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:bloc/bloc.dart';
import 'package:foodprint/domain/auth/i_auth_repository.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthRepository _authClient;

  AuthBloc(this._authClient) : super(const AuthState.initial());

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
    yield* event.map(authCheckStarted: (e) async* {
      final Option<JWT> result = await _authClient.getUserToken();
      yield result.fold(() => const AuthState.unauthenticated(),
          (token) => AuthState.authenticated(token: token));
    }, loggedIn: (e) async* {
      yield const AuthState.loading();
      yield AuthState.authenticated(token: e.token);
    }, loggedOut: (e) async* {
      await _authClient.logout();
      yield const AuthState.unauthenticated(); // user logged out
    }, refreshAccount: (e) async* {
      yield const AuthState.loading();
      await _authClient.replaceToken(newToken: e.token);
      yield AuthState.authenticated(token: e.token);
    });
  }
}
