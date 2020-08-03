import 'dart:async';
import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/photos/i_photo_repository.dart';
import 'package:foodprint/domain/photos/photo_detail_entity.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/domain/photos/photo_failure.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/infrastructure/core/tokens.dart';
import 'package:foodprint/infrastructure/foodprint/local_foodprint_client.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

// This class is responsible for making requests to the API regarding photo features
@LazySingleton(as: IPhotoRepository)
class RemotePhotosClient implements IPhotoRepository {
  final LocalFoodprintClient _localFoodprintClient;

  RemotePhotosClient(this._localFoodprintClient);

  // Construct the JSON body for saving a photo
  static String createSaveRequestBody(UserID id, PhotoEntity photo,
      RestaurantEntity restaurant, PhotoData imageData) {
    return jsonEncode({
      "userId": id.getOrCrash().toString(),
      "image": {
        "path": photo.storagePath.getOrCrash(),
        "data": imageData.getOrCrash().toString(),
        "favourite": photo.isFavourite ? 'true' : 'false',
        "details": {
          "name": photo.details.name.getOrCrash(),
          "price": photo.details.price.getOrCrash().toString(),
          "comments": photo.details.comments.getOrCrash(),
          "timestamp": photo.timestamp.getOrCrash(),
        },
        "location": {
          "id": restaurant.restaurantID.getOrCrash(),
          "name": restaurant.restaurantName.getOrCrash(),
          "rating": restaurant.restaurantRating.getOrCrash().toString(),
          "lat": restaurant.latitude.getOrCrash().toString(),
          "lng": restaurant.longitude.getOrCrash().toString(),
          "types": restaurant.types.getOrCrash(),
        }
      }
    });
  }

  // Save a new photo
  @override
  Future<Either<PhotoFailure, FoodprintEntity>> saveNewPhoto(
      {@required UserID userID,
      @required PhotoData data,
      @required PhotoEntity photo,
      @required RestaurantEntity restaurant,
      @required FoodprintEntity oldFoodprint}) async {
    final String requestBody =
        createSaveRequestBody(userID, photo, restaurant, data);

    final res = await http.post("$serverIP/api/photos/",
        headers: {"Content-Type": 'application/json'}, body: requestBody);
    if (res.statusCode == 200) {
      final String url = res.body;

      final PhotoEntity newPhoto = PhotoEntity(
          storagePath: photo.storagePath,
          url: URL(url),
          details: photo.details,
          timestamp: photo.timestamp,
          isFavourite: photo.isFavourite);

      // Update local foodprint
      final FoodprintEntity newFoodprint =
          _localFoodprintClient.addPhotoToFoodprint(
              newPhoto: newPhoto,
              restaurant: restaurant,
              oldFoodprint: oldFoodprint);
      return right(newFoodprint);
    } else if (res.statusCode == 401) {
      return left(const PhotoFailure.invalidPhoto());
    } else {
      return left(const PhotoFailure.serverError());
    }
  }

  // Edit a photo on the server side
  @override
  Future<Either<PhotoFailure, FoodprintEntity>> updatePhotoDetails(
      {@required PhotoEntity oldPhoto,
      @required PhotoDetailEntity details,
      @required bool isFavourite,
      @required RestaurantEntity restaurant,
      @required FoodprintEntity oldFoodprint}) async {
    final res = await http.put("$serverIP/api/photos", body: {
      "path": oldPhoto.storagePath.getOrCrash(),
      "photo_name": details.name.getOrCrash(),
      "price": details.price.getOrCrash().toString(),
      "comments": details.comments.getOrCrash(),
      "favourite": isFavourite ? 'true' : 'false'
    });

    if (res.statusCode == 200) {
      final PhotoEntity newPhoto = PhotoEntity(
          storagePath: oldPhoto.storagePath,
          url: oldPhoto.url,
          details: details,
          timestamp: oldPhoto.timestamp,
          isFavourite: isFavourite);

      final FoodprintEntity newFoodprint =
          _localFoodprintClient.editPhotoInFoodprint(
              photo: newPhoto,
              restaurant: restaurant,
              oldFoodprint: oldFoodprint);
      return right(newFoodprint);
    } else if (res.statusCode == 401) {
      return left(const PhotoFailure.invalidPhoto());
    } else {
      return left(const PhotoFailure.serverError());
    }
  }

  // Delete a photo
  @override
  Future<Either<PhotoFailure, FoodprintEntity>> deletePhoto(
      {@required PhotoEntity photo,
      @required RestaurantEntity restaurant,
      @required FoodprintEntity oldFoodprint}) async {
    final res = await http.delete("$serverIP/api/photos/",
        headers: {"photo_path": photo.storagePath.getOrCrash()});

    if (res.statusCode == 200) {
      final FoodprintEntity newFoodprint =
          _localFoodprintClient.removePhotoFromFoodprint(
              photo: photo, restaurant: restaurant, oldFoodprint: oldFoodprint);
      return right(newFoodprint);
    } else if (res.statusCode == 401) {
      return left(const PhotoFailure.invalidPhoto());
    } else {
      return left(const PhotoFailure.serverError());
    }
  }
}
