// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:foodprint/infrastructure/location/device_location_client.dart';
import 'package:location/location.dart';
import 'package:foodprint/infrastructure/auth/custom_auth_facade.dart';
import 'package:foodprint/domain/auth/i_auth_facade.dart';
import 'package:foodprint/application/auth/login_form/login_form_bloc.dart';
import 'package:foodprint/application/restaurants/restaurant_search_bloc.dart';
import 'package:foodprint/domain/restaurants/i_restaurant_search_respository.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerFactory<DeviceLocationClient>(
      () => DeviceLocationClient(location: g<Location>()));
  g.registerLazySingleton<IAuthFacade>(() => CustomAuthFacade());
  g.registerFactory<LoginFormBloc>(() => LoginFormBloc(g<IAuthFacade>()));
  g.registerFactory<RestaurantSearchBloc>(
      () => RestaurantSearchBloc(g<IRestaurantSearchRepository>()));
  g.registerFactory<AuthBloc>(() => AuthBloc(g<IAuthFacade>()));
}
