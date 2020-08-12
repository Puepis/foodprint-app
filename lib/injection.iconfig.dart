// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:foodprint/domain/manual_search/search_cache.dart';
import 'package:foodprint/infrastructure/account/account_client.dart';
import 'package:foodprint/domain/account/i_account_repository.dart';
import 'package:foodprint/infrastructure/auth/auth_client.dart';
import 'package:foodprint/domain/auth/i_auth_repository.dart';
import 'package:foodprint/infrastructure/location/device_location_client.dart';
import 'package:foodprint/domain/location/i_location_repository.dart';
import 'package:foodprint/infrastructure/photos/remote_photos_client.dart';
import 'package:foodprint/domain/photos/i_photo_repository.dart';
import 'package:foodprint/infrastructure/restaurants/google_place_search_client.dart';
import 'package:foodprint/domain/restaurants/i_restaurant_search_respository.dart';
import 'package:foodprint/application/location/location_bloc.dart';
import 'package:foodprint/application/auth/login_form/login_form_bloc.dart';
import 'package:foodprint/application/restaurants/manual_search/manual_search_bloc.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/application/auth/register_form/register_form_bloc.dart';
import 'package:foodprint/application/restaurants/nearby_search/restaurant_search_bloc.dart';
import 'package:foodprint/application/account/account_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/infrastructure/foodprint/remote_foodprint_client.dart';
import 'package:foodprint/domain/foodprint/i_foodprint_repository.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<IAccountRepository>(() => AccountClient());
  g.registerLazySingleton<IAuthRepository>(() => AuthClient());
  g.registerLazySingleton<ILocationRepository>(() => DeviceLocationClient());
  g.registerLazySingleton<IPhotoRepository>(() => RemotePhotosClient());
  g.registerLazySingleton<IRestaurantSearchRepository>(
      () => GooglePlaceSearchClient());
  g.registerFactory<LocationBloc>(() => LocationBloc(g<ILocationRepository>()));
  g.registerFactory<LoginFormBloc>(() => LoginFormBloc(g<IAuthRepository>()));
  g.registerFactory<ManualSearchBloc>(() => ManualSearchBloc(
      g<IRestaurantSearchRepository>(), g<AutocompleteSearchCache>()));
  g.registerFactory<PhotoActionsBloc>(
      () => PhotoActionsBloc(g<IPhotoRepository>(), g<IAuthRepository>()));
  g.registerFactory<RegisterFormBloc>(
      () => RegisterFormBloc(g<IAuthRepository>()));
  g.registerFactory<RestaurantSearchBloc>(
      () => RestaurantSearchBloc(g<IRestaurantSearchRepository>()));
  g.registerFactory<AccountBloc>(
      () => AccountBloc(g<IAccountRepository>(), g<IAuthRepository>()));
  g.registerFactory<AuthBloc>(() => AuthBloc(g<IAuthRepository>()));
  g.registerLazySingleton<IFoodprintRepository>(
      () => RemoteFoodprintClient(g<IRestaurantSearchRepository>()));
  g.registerFactory<FoodprintBloc>(
      () => FoodprintBloc(g<IFoodprintRepository>()));

  //Eager singletons must be registered in the right order
  g.registerSingleton<AutocompleteSearchCache>(AutocompleteSearchCache());
}
