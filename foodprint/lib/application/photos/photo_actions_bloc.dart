import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/i_photo_repository.dart';
import 'package:foodprint/domain/photos/photo_detail_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/photos/photo_failure.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

part 'photo_actions_event.dart';
part 'photo_actions_state.dart';
part 'photo_actions_bloc.freezed.dart';

// This is the business logic component for handling photo actions (edit, save, delete)
@injectable
class PhotoActionsBloc extends Bloc<PhotoActionsEvent, PhotoActionsState> {
  final IPhotoRepository _client;

  PhotoActionsBloc(this._client) : super(const PhotoActionsState.initial());

  static int get secondsSinceEpoch =>
      (DateTime.now().millisecondsSinceEpoch / 1000).round();

  // Formats the datetime
  static String get currentTimestamp {
    final DateTime now = DateTime.now();
    final String y = now.year.toString();
    final String m = _formatZero(now.month);
    final String d = _formatZero(now.day);
    final String h = _formatZero(now.hour);
    final String min = _formatZero(now.minute);
    final String second = _formatZero(now.second);
    return "$y-$m-$d $h:$min:$second-04"; // TODO: handle timezone
  }

  /// Determines whether to add a zero in front of a numeric value
  static String _formatZero(int value) {
    return value < 10 ? "0$value" : value.toString();
  }

  /// Creates a new [PhotoEntity] based on the saved parameters
  static PhotoEntity _generateNewPhoto(
      int id, File imageFile, String itemName, String price, String comments) {
    final String time = currentTimestamp;
    final String fileName = basename(imageFile.path);
    final String imgPath = '$id/photos/$fileName';

    // Construct new photo
    return PhotoEntity(
        storagePath: StoragePath(imgPath),
        photoDetail: PhotoDetailEntity(
            name: PhotoName(itemName),
            price: PhotoPrice(double.parse(price)),
            comments: PhotoComments(comments)),
        timestamp: Timestamp(time.substring(0, time.length - 3)),
        isFavourite: false);
  }

  @override
  Stream<PhotoActionsState> mapEventToState(
    PhotoActionsEvent event,
  ) async* {
    yield const PhotoActionsState.actionInProgress();
    yield* event.map(deleted: (e) async* {
      yield* _mapDeletedToState(e.photo, e.restaurant, e.foodprint);
    }, edited: (e) async* {
      yield* _mapEditedToState(e.newName, e.newPrice, e.newComments,
          e.isFavourite, e.oldPhoto, e.restaurant, e.foodprint);
    }, saved: (e) async* {
      yield* _mapSavedToState(e.userID, e.imageFile, e.itemName, e.price,
          e.comments, e.restaurant, e.foodprint);
    });
  }

  Stream<PhotoActionsState> _mapDeletedToState(PhotoEntity photo,
      RestaurantEntity restaurant, FoodprintEntity foodprint) async* {
    final result = await _client.deletePhoto(
        photo: photo, restaurant: restaurant, oldFoodprint: foodprint);
    yield result.fold((failure) => PhotoActionsState.deleteFailure(failure),
        (newFoodprint) => PhotoActionsState.deleteSuccess(newFoodprint));
  }

  Stream<PhotoActionsState> _mapEditedToState(
      String newName,
      String newPrice,
      String newComments,
      bool isFavourite,
      PhotoEntity oldPhoto,
      RestaurantEntity restaurant,
      FoodprintEntity foodprint) async* {
    final newDetails = PhotoDetailEntity(
        name: PhotoName(newName),
        price: PhotoPrice(double.parse(newPrice)),
        comments: PhotoComments(newComments));
    final result = await _client.updatePhotoDetails(
        oldPhoto: oldPhoto,
        photoDetail: newDetails,
        restaurant: restaurant,
        oldFoodprint: foodprint,
        isFavourite: isFavourite);
    yield result.fold(
      (failure) => PhotoActionsState.editFailure(failure),
      (newFoodprint) => PhotoActionsState.editSuccess(newFoodprint),
    );
  }

  Stream<PhotoActionsState> _mapSavedToState(
      UserID userID,
      File imageFile,
      String itemName,
      String price,
      String comments,
      RestaurantEntity restaurant,
      FoodprintEntity foodprint) async* {
    final newPhoto = _generateNewPhoto(
        userID.getOrCrash(), imageFile, itemName, price, comments);
    final result = await _client.saveNewPhoto(
        userID: userID,
        data: PhotoData(imageFile.readAsBytesSync().toList()), // Image data
        photo: newPhoto,
        restaurant: restaurant,
        oldFoodprint: foodprint);
    yield result.fold((l) => PhotoActionsState.saveFailure(l),
        (r) => PhotoActionsState.saveSuccess(r));
  }
}
