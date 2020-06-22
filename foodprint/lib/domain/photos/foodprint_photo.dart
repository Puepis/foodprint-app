

import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/photos/photo_detail.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'foodprint_photo.freezed.dart';

@freezed
abstract class FoodprintPhoto implements _$FoodprintPhoto {
  const FoodprintPhoto._();

  const factory FoodprintPhoto({
    @required StoragePath storagePath,
    @required PhotoData imageData,
    @required PhotoDetail photoDetail,
    @required Timestamp timestamp,
  }) = _FoodprintPhoto;

  Option<ValueFailure<dynamic>> get failureOption {
    return storagePath.failureOrNone
        .andThen(imageData.failureOrNone)
        .fold((f) => some(f), (_) => none());
  }
}