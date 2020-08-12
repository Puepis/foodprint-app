import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:foodprint/domain/auth/i_auth_repository.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
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
import 'package:rxdart/rxdart.dart';

part 'photo_actions_event.dart';
part 'photo_actions_state.dart';
part 'photo_actions_bloc.freezed.dart';

/// The BLoC that is reponsible for handling photo actions (save, edit, delete).
///
/// Maps incoming [PhotoActionsEvent] to [PhotoActionsState].
@injectable
class PhotoActionsBloc extends Bloc<PhotoActionsEvent, PhotoActionsState> {
  final IPhotoRepository _photoClient;
  final IAuthRepository _authClient;

  PhotoActionsBloc(this._photoClient, this._authClient)
      : super(const PhotoActionsState.initial());

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
  Stream<Transition<PhotoActionsEvent, PhotoActionsState>> transformEvents(
      Stream<PhotoActionsEvent> events,
      TransitionFunction<PhotoActionsEvent, PhotoActionsState> transitionFn) {
    // No delay
    final nonDebounceStream =
        events.where((event) => event is! FavouriteChanged);

    final debounceStream = events
        .where((event) => event is FavouriteChanged)
        .debounceTime(const Duration(milliseconds: 300));

    return super.transformEvents(
        nonDebounceStream.mergeWith([debounceStream]), transitionFn);
  }

  @override
  Stream<PhotoActionsState> mapEventToState(
    PhotoActionsEvent event,
  ) async* {
    yield const PhotoActionsState.actionInProgress();

    // Check if token has expired
    JWT accessToken;
    if (event.accessToken.isExpired) {
      final result = await _authClient.getAccessToken();
      accessToken = result.fold(() => null, (token) => token);
    }
    accessToken ??= event.accessToken;

    yield* event.map(deleted: (e) async* {
      yield* _mapDeletedToState(accessToken, e.photo);
    }, edited: (e) async* {
      yield* _mapEditedToState(accessToken, e.newName, e.newPrice,
          e.newComments, e.isFavourite, e.oldPhoto);
    }, saved: (e) async* {
      yield* _mapSavedToState(
          accessToken, e.imageFile, e.itemName, e.price, e.comments, e.placeID);
    }, favouriteChanged: (e) async* {
      yield* _mapFavouriteChangedToState(accessToken, e.photo, e.newFavourite);
    });
  }

  Stream<PhotoActionsState> _mapDeletedToState(
      JWT accessToken, PhotoEntity photo) async* {
    final result =
        await _photoClient.deletePhoto(accessToken: accessToken, photo: photo);
    yield result.fold((failure) => PhotoActionsState.deleteFailure(failure),
        (_) => const PhotoActionsState.deleteSuccess());
  }

  Stream<PhotoActionsState> _mapEditedToState(
    JWT accessToken,
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

    final newPhoto =
        oldPhoto.copyWith(details: newDetails, isFavourite: isFavourite);
    final result = await _photoClient.updatePhoto(
        accessToken: accessToken, newPhoto: newPhoto);
    yield result.fold(
      (failure) => PhotoActionsState.editFailure(failure),
      (_) => PhotoActionsState.editSuccess(newPhoto),
    );
  }

  Stream<PhotoActionsState> _mapSavedToState(
    JWT accessToken,
    File imageFile,
    String itemName,
    String price,
    String comments,
    RestaurantID placeId,
  ) async* {
    final id = accessToken.id;
    final newPhoto =
        _generateNewPhoto(id, imageFile, itemName, price, comments);
    final result = await _photoClient.saveNewPhoto(
      accessToken: accessToken,
      data: PhotoData(imageFile.readAsBytesSync().toList()), // Image data
      photo: newPhoto,
      placeID: placeId,
    );
    yield result.fold((l) => PhotoActionsState.saveFailure(l),
        (photo) => PhotoActionsState.saveSuccess(photo));
  }

  Stream<PhotoActionsState> _mapFavouriteChangedToState(
      JWT accessToken, PhotoEntity photo, bool favourite) async* {
    final newPhoto = photo.copyWith(isFavourite: favourite);
    final result = await _photoClient.updateFavourite(
        accessToken: accessToken, updatedPhoto: newPhoto);
    yield result.fold(
        (failure) => PhotoActionsState.changeFavouriteFailure(failure),
        (_) =>
            PhotoActionsState.changeFavouriteSuccess(isFavourite: favourite));
  }
}
