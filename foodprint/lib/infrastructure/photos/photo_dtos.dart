
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/photos/foodprint_photo.dart';
import 'package:foodprint/domain/photos/photo_detail.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_dtos.freezed.dart';
part 'photo_dtos.g.dart'; // convert DTOs to and from JSON

@freezed
abstract class PhotoDTO implements _$PhotoDTO {
  const PhotoDTO._();

  const factory PhotoDTO({
    @required String storagePath,
    @required List<int> bytes,
    @required PhotoDetailDTO photoDetail,
    @required String timestamp, 
  }) = _NoteDto;

  // Convert entity to DTO
  factory PhotoDTO.fromDomain(FoodprintPhoto photo) {
    return PhotoDTO(
      storagePath: photo.storagePath.getOrCrash(), // unexpected errors
      bytes: photo.imageData.getOrCrash(),
      photoDetail: PhotoDetailDTO.fromDomain(photo.photoDetail),
      timestamp: photo.timestamp.getOrCrash(),
    );
  }

  // Convert DTO to entity
  FoodprintPhoto toDomain() {
    return FoodprintPhoto(
      storagePath: StoragePath(storagePath), 
      imageData: PhotoData(bytes),
      photoDetail: photoDetail.toDomain(),
      timestamp: Timestamp(timestamp)
    );
  }

  factory PhotoDTO.fromJson(Map<String, dynamic> json) =>
      _$PhotoDTOFromJson(json);
}

@freezed
abstract class PhotoDetailDTO implements _$PhotoDetailDTO {
  const PhotoDetailDTO._();

  const factory PhotoDetailDTO({
    @required String name,
    @required double price,
    @required String comments,
  }) = _PhotoDetailDTO;

  factory PhotoDetailDTO.fromDomain(PhotoDetail photoDetail) {
    return PhotoDetailDTO(
      name: photoDetail.name.getOrCrash(),
      price: photoDetail.price.getOrCrash(),
      comments: photoDetail.comments.getOrCrash()
    );
  }

  // Convert DTO to entity
  PhotoDetail toDomain() {
    return PhotoDetail(
      name: PhotoName(name),
      price: PhotoPrice(price),
      comments: PhotoComments(comments)
    );
  }

  factory PhotoDetailDTO.fromJson(Map<String, dynamic> json) =>
      _$PhotoDetailDTOFromJson(json);
}