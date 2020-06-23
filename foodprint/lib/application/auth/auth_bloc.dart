import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/auth/i_auth_facade.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/auth/user.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'auth_event.dart';
part 'auth_state.dart';
part 'auth_bloc.freezed.dart';

@injectable
class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IAuthFacade _authFacade;

  AuthBloc(this._authFacade);

  @override
  AuthState get initialState => const AuthState.initial();

  @override
  Stream<AuthState> mapEventToState(
    AuthEvent event,
  ) async* {
   yield* event.map(
      authCheckRequested: (e) async* {
        final Option<JWT> userOption = await _authFacade.getUserToken();
        yield userOption.fold(
          () => const AuthState.unauthenticated(), // not logged in 
          (_) {
            return const AuthState.authenticated();
          }, // token exists, check expiry 
        );
      },
      loggedOut: (e) async* {
        await _authFacade.logout(user: e.user);
        yield const AuthState.unauthenticated(); // user logged out
      },
    ); 
  }
}
