

import 'dart:typed_data';

import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/photos/photo_detail_entity.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_entity.freezed.dart';

@freezed
abstract class PhotoEntity implements _$PhotoEntity {
  const PhotoEntity._();

  const factory PhotoEntity({
    @required StoragePath storagePath,
    @required PhotoData imageData,
    @required PhotoDetailEntity photoDetail,
    @required Timestamp timestamp,
  }) = _PhotoEntity;

  Option<ValueFailure<dynamic>> get failureOption {
    return storagePath.failureOrNone
        .andThen(imageData.failureOrNone)
        .andThen(timestamp.failureOrNone)
        .andThen(photoDetail.failureOption.fold(() => right(unit), (f) => left(f)))
        .fold((f) => some(f), (_) => none());
  }

  Uint8List get bytes {
    return Uint8List.fromList(imageData.getOrCrash());
  }
}