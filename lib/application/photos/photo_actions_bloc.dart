import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:foodprint/domain/auth/value_objects.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/photos/i_photo_repository.dart';
import 'package:foodprint/domain/photos/photo_detail_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/photos/photo_failure.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:foodprint/domain/restaurants/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:meta/meta.dart';
import 'package:path/path.dart';

part 'photo_actions_event.dart';
part 'photo_actions_state.dart';
part 'photo_actions_bloc.freezed.dart';

/// This is the business logic component for handling photo actions (edit, save, delete)
@injectable
class PhotoActionsBloc extends Bloc<PhotoActionsEvent, PhotoActionsState> {
  final IPhotoRepository _client;

  PhotoActionsBloc(this._client) : super(const PhotoActionsState.initial());

  static int get secondsSinceEpoch =>
      (DateTime.now().millisecondsSinceEpoch / 1000).round();

  // Formats the datetime
  static String get currentTimestamp {
    final DateTime now = DateTime.now();
    final String offset = now.timeZoneOffset.toString().split(":").first;
    final String y = now.year.toString();
    final String m = _formatZero(now.month);
    final String d = _formatZero(now.day);
    final String h = _formatZero(now.hour);
    final String min = _formatZero(now.minute);
    final String second = _formatZero(now.second);
    final String zone = now.timeZoneOffset.isNegative ? offset : "+$offset";
    return "$y-$m-$d $h:$min:$second$zone";
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
        details: PhotoDetailEntity(
            name: PhotoName(itemName),
            price: PhotoPrice(double.parse(price)),
            comments: PhotoComments(comments)),
        timestamp: Timestamp(time),
        isFavourite: false);
  }

  @override
  Stream<PhotoActionsState> mapEventToState(
    PhotoActionsEvent event,
  ) async* {
    yield const PhotoActionsState.actionInProgress();
    yield* event.map(deleted: (e) async* {
      yield* _mapDeletedToState(e.photo);
    }, edited: (e) async* {
      yield* _mapEditedToState(
          e.newName, e.newPrice, e.newComments, e.isFavourite, e.oldPhoto);
    }, saved: (e) async* {
      yield* _mapSavedToState(
          e.userID, e.imageFile, e.itemName, e.price, e.comments, e.placeID);
    });
  }

  Stream<PhotoActionsState> _mapDeletedToState(PhotoEntity photo) async* {
    final result = await _client.deletePhoto(photo: photo);
    yield result.fold((failure) => PhotoActionsState.deleteFailure(failure),
        (_) => const PhotoActionsState.deleteSuccess());
  }

  Stream<PhotoActionsState> _mapEditedToState(
    String newName,
    String newPrice,
    String newComments,
    bool isFavourite,
    PhotoEntity oldPhoto,
  ) async* {
    final newDetails = PhotoDetailEntity(
        name: PhotoName(newName),
        price: PhotoPrice(double.parse(newPrice)),
        comments: PhotoComments(newComments));
    final result = await _client.updatePhotoDetails(
        oldPhoto: oldPhoto, details: newDetails, isFavourite: isFavourite);
    yield result.fold(
      (failure) => PhotoActionsState.editFailure(failure),
      (_) => const PhotoActionsState.editSuccess(),
    );
  }

  Stream<PhotoActionsState> _mapSavedToState(
    UserID userID,
    File imageFile,
    String itemName,
    String price,
    String comments,
    RestaurantID id,
  ) async* {
    final newPhoto = _generateNewPhoto(
        userID.getOrCrash(), imageFile, itemName, price, comments);
    final result = await _client.saveNewPhoto(
      userID: userID,
      data: PhotoData(imageFile.readAsBytesSync().toList()), // Image data
      photo: newPhoto,
      placeID: id,
    );
    yield result.fold((l) => PhotoActionsState.saveFailure(l),
        (_) => const PhotoActionsState.saveSuccess());
  }
}
