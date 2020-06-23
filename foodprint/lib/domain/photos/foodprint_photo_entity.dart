

import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/photos/photo_detail_entity.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'foodprint_photo_entity.freezed.dart';

@freezed
abstract class FoodprintPhotoEntity implements _$FoodprintPhotoEntity {
  const FoodprintPhotoEntity._();

  const factory FoodprintPhotoEntity({
    @required StoragePath storagePath,
    @required PhotoData imageData,
    @required PhotoDetailEntity photoDetail,
    @required Timestamp timestamp,
  }) = _FoodprintPhoto;

  Option<ValueFailure<dynamic>> get failureOption {
    return storagePath.failureOrNone
        .andThen(imageData.failureOrNone)
        .andThen(timestamp.failureOrNone)
        .andThen(photoDetail.failureOption.fold(() => right(unit), (f) => left(f)))
        .fold((f) => some(f), (_) => none());
  }
}