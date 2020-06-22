import 'package:dartz/dartz.dart';
import 'package:foodprint/domain/core/failures.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_detail.freezed.dart';

@freezed
abstract class PhotoDetail implements _$PhotoDetail {
  const PhotoDetail._();

  const factory PhotoDetail({
    @required PhotoName name,
    @required PhotoPrice price,
    @required PhotoComments comments, 
  }) = _PhotoDetail;

  Option<ValueFailure<dynamic>> get failureOption {
    return name.value.fold((f) => some(f), (_) => none());
  }
}