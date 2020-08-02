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
    URL url,
    @required PhotoDetailEntity photoDetail,
    @required Timestamp timestamp,
    @required bool isFavourite,
  }) = _PhotoEntity;

  /// Either some type of value failure or none()
  Option<ValueFailure<dynamic>> get failureOption {
    return storagePath.failureOrNone
        .andThen(url.failureOrNone)
        .andThen(timestamp.failureOrNone)
        .andThen(
            photoDetail.failureOption.fold(() => right(unit), (f) => left(f)))
        .fold((f) => some(f), (_) => none());
  }
}
