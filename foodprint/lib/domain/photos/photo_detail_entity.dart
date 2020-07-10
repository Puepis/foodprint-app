import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_detail_entity.freezed.dart';

@freezed
abstract class PhotoDetailEntity implements _$PhotoDetailEntity {
  const PhotoDetailEntity._();

  const factory PhotoDetailEntity({
    @required PhotoName name,
    @required PhotoPrice price,
    @required PhotoComments comments, 
  }) = _PhotoDetailEntity;

  Option<ValueFailure<dynamic>> get failureOption {
    return name.value.fold((f) => some(f), (_) => none());
  }
}