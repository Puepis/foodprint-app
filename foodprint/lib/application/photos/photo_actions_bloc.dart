import 'dart:async';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:foodprint/domain/auth/user.dart';
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

  PhotoActionsBloc(this._client);

  @override
  PhotoActionsState get initialState => const PhotoActionsState.intial();

  static int get secondsSinceEpoch =>
      (DateTime.now().millisecondsSinceEpoch / 1000).round();

  // Format datetime
  static String get currentTimestamp {
    final DateTime now = DateTime.now();
    final String y = now.year.toString();
    final String m = now.month < 10 ? "0${now.month}" : now.month.toString();
    final String d = now.day.toString();
    final String h = now.hour.toString();
    final String min =
        now.minute < 10 ? "0${now.minute}" : now.minute.toString();
    final String second =
        now.second < 10 ? "0${now.second}" : now.second.toString();
    return "$y-$m-$d $h:$min:$second-04"; // TODO: handle timezone
  }

  static PhotoEntity generateNewPhoto(
      int id, File imageFile, String itemName, String price, String comments) {

    final String time = currentTimestamp;
    final String fileName = basename(imageFile.path);
    final String imgPath = '$id/photos/$secondsSinceEpoch-$fileName';
    final List<int> imgBytes = imageFile.readAsBytesSync().toList();

    // Construct new photo
    return PhotoEntity(
      storagePath: StoragePath(imgPath),
      imageData: PhotoData(imgBytes),
      photoDetail: PhotoDetailEntity(
          name: PhotoName(itemName),
          price: PhotoPrice(double.parse(price)),
          comments: PhotoComments(comments)),
      timestamp: Timestamp(time.substring(0, time.length - 3)),
    );
  }

  @override
  Stream<PhotoActionsState> mapEventToState(
    PhotoActionsEvent event,
  ) async* {
    yield const PhotoActionsState.actionInProgress();
    yield* event.map(deleted: (e) async* {
      final result = await _client.deletePhoto(
          photo: e.photo, restaurant: e.restaurant, oldFoodprint: e.foodprint);
      yield result.fold((failure) => PhotoActionsState.deleteFailure(failure),
          (newFoodprint) => PhotoActionsState.deleteSuccess(newFoodprint));
    }, edited: (e) async* {
      final newDetails = PhotoDetailEntity(
          name: PhotoName(e.newName),
          price: PhotoPrice(double.parse(e.newPrice)),
          comments: PhotoComments(e.newComments));
      final result = await _client.updatePhotoDetails(
          oldPhoto: e.oldPhoto,
          photoDetail: newDetails,
          restaurant: e.restaurant,
          oldFoodprint: e.foodprint);
      yield result.fold(
        (failure) => PhotoActionsState.editFailure(failure),
        (newFoodprint) => PhotoActionsState.editSuccess(newFoodprint),
      );
    }, saved: (e) async* {
      final newPhoto = generateNewPhoto(
          e.user.id.getOrCrash(), e.imageFile, e.itemName, e.price, e.comments);
      final result = await _client.saveNewPhoto(
          user: e.user,
          photo: newPhoto,
          restaurant: e.restaurant,
          oldFoodprint: e.foodprint);
      yield result.fold((l) => PhotoActionsState.saveFailure(l),
          (r) => PhotoActionsState.editSuccess(r));
    });
  }
}
