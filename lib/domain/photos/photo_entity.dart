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
    final URL url,
    @required PhotoDetailEntity details,
    @required Timestamp timestamp,
    @required bool isFavourite,
  }) = _PhotoEntity;
}
