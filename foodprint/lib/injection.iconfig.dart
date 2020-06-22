// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:foodprint/infrastructure/auth/custom_auth_facade.dart';
import 'package:foodprint/application/auth/login_form/login_form_bloc.dart';
import 'package:foodprint/domain/auth/i_auth_facade.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<CustomAuthFacade>(() => CustomAuthFacade());
  g.registerFactory<LoginFormBloc>(() => LoginFormBloc(g<IAuthFacade>()));
}
