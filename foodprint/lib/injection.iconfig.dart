// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:foodprint/infrastructure/photos/remote_photos_client.dart';
import 'package:foodprint/domain/photos/i_photo_repository.dart';
import 'package:foodprint/infrastructure/foodprint/remote_foodprint_client.dart';
import 'package:foodprint/domain/foodprint/i_remote_foodprint_repository.dart';
import 'package:foodprint/infrastructure/restaurants/google_place_search_client.dart';
import 'package:foodprint/domain/restaurants/i_restaurant_search_respository.dart';
import 'package:foodprint/infrastructure/local_storage/local_storage_client.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:foodprint/application/photos/photo_actions_bloc.dart';
import 'package:foodprint/application/restaurants/restaurant_search_bloc.dart';
import 'package:foodprint/infrastructure/location/device_location_client.dart';
import 'package:foodprint/domain/location/i_locator_repository.dart';
import 'package:location/location.dart';
import 'package:foodprint/application/foodprint/foodprint_bloc.dart';
import 'package:foodprint/infrastructure/auth/auth_client.dart';
import 'package:foodprint/domain/auth/i_auth_repository.dart';
import 'package:foodprint/application/location/location_bloc.dart';
import 'package:foodprint/application/auth/login_form/login_form_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:get_it/get_it.dart';

void $initGetIt(GetIt g, {String environment}) {
  g.registerLazySingleton<IPhotoRepository>(() => RemotePhotosClient());
  g.registerLazySingleton<IRemoteFoodprintRepository>(
      () => RemoteFoodprintClient());
  g.registerLazySingleton<IRestaurantSearchRepository>(
      () => GooglePlaceSearchClient());
  g.registerFactory<JWTStorageClient>(
      () => JWTStorageClient(storage: g<FlutterSecureStorage>()));
  g.registerFactory<PhotoActionsBloc>(
      () => PhotoActionsBloc(g<IPhotoRepository>()));
  g.registerFactory<RestaurantSearchBloc>(
      () => RestaurantSearchBloc(g<IRestaurantSearchRepository>()));
  g.registerLazySingleton<UserLocator>(
      () => DeviceLocationClient(location: g<Location>()));
  g.registerFactory<FoodprintBloc>(
      () => FoodprintBloc(g<IRemoteFoodprintRepository>()));
  g.registerLazySingleton<IAuthRepository>(
      () => AuthClient(g<JWTStorageClient>()));
  g.registerFactory<LocationBloc>(() => LocationBloc(g<UserLocator>()));
  g.registerFactory<LoginFormBloc>(() => LoginFormBloc(g<IAuthRepository>()));
  g.registerFactory<AuthBloc>(() => AuthBloc(g<IAuthRepository>()));
}
