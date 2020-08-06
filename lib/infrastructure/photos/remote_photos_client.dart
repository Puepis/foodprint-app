import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/photos/i_photo_repository.dart';
import 'package:foodprint/domain/photos/photo_detail_entity.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:foodprint/domain/photos/photo_failure.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/value_objects.dart';
import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';

// This class is responsible for making requests to the API regarding photo features
@LazySingleton(as: IPhotoRepository)
class RemotePhotosClient implements IPhotoRepository {
  RemotePhotosClient();

  // Construct the JSON body for saving a photo
  static String _createSaveRequestBody(
      UserID id, PhotoEntity photo, RestaurantID placeID, PhotoData imageData) {
    return jsonEncode({
      "userId": id.getOrCrash().toString(),
      "image": {
        "path": photo.storagePath.getOrCrash(),
        "data": imageData.getOrCrash().toString(),
        "favourite": photo.isFavourite.toString(),
        "details": {
          "name": photo.details.name.getOrCrash(),
          "price": photo.details.price.getOrCrash().toString(),
          "comments": photo.details.comments.getOrCrash(),
          "timestamp": photo.timestamp.getOrCrash(),
        },
        "place_id": placeID.getOrCrash()
      }
    });
  }

  /// Handle the reponse codes
  Either<PhotoFailure, Unit> _handleResponse(res) {
    if (res.statusCode == 200) {
      return right(unit);
    } else if (res.statusCode == 401) {
      return left(const PhotoFailure.invalidPhoto());
    } else {
      return left(const PhotoFailure.serverError());
    }
  }

  /// Save a new photo
  @override
  Future<Either<PhotoFailure, Unit>> saveNewPhoto({
    @required UserID userID,
    @required PhotoData data,
    @required PhotoEntity photo,
    @required RestaurantID placeID,
  }) async {
    final String requestBody =
        _createSaveRequestBody(userID, photo, placeID, data);

    http.Response res;
    try {
      res = await http.post("${DotEnv().env['SERVER_IP']}/api/photos/",
          headers: {"Content-Type": 'application/json'}, body: requestBody);
    } on SocketException {
      return left(const PhotoFailure.noInternet());
    }

    return _handleResponse(res);
  }

  /// Edit a photo on the server side
  @override
  Future<Either<PhotoFailure, Unit>> updatePhotoDetails({
    @required PhotoEntity oldPhoto,
    @required PhotoDetailEntity details,
    @required bool isFavourite,
  }) async {
    http.Response res;
    try {
      res = await http.put("${DotEnv().env['SERVER_IP']}/api/photos", body: {
        "path": oldPhoto.storagePath.getOrCrash(),
        "photo_name": details.name.getOrCrash(),
        "price": details.price.getOrCrash().toString(),
        "comments": details.comments.getOrCrash(),
        "favourite": isFavourite.toString()
      });
    } on SocketException {
      return left(const PhotoFailure.noInternet());
    }

    return _handleResponse(res);
  }

  /// Delete a photo
  @override
  Future<Either<PhotoFailure, Unit>> deletePhoto({
    @required PhotoEntity photo,
  }) async {
    http.Response res;
    try {
      res = await http.delete("${DotEnv().env['SERVER_IP']}/api/photos/",
          headers: {"photo_path": photo.storagePath.getOrCrash()});
    } on SocketException {
      return left(const PhotoFailure.noInternet());
    }

    return _handleResponse(res);
  }
}
