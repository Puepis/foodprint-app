
import 'package:flutter/foundation.dart';
import 'package:foodprint/domain/core/value_objects.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/photos/photo_detail_entity.dart';
import 'package:foodprint/domain/photos/value_objects.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'photo_dtos.freezed.dart';

// Data transfer object = model
@freezed
abstract class PhotoDTO implements _$PhotoDTO {
  const PhotoDTO._();

  const factory PhotoDTO({
    @required String storagePath,
    @required String url,
    @required PhotoDetailDTO photoDetail,
    @required String timestamp, 
    @required bool isFavourite,
  }) = _PhotoDTO;

  // Convert entity to DTO
  factory PhotoDTO.fromEntity(PhotoEntity photo) {
    return PhotoDTO(
      storagePath: photo.storagePath.getOrCrash(), // unexpected errors
      url: photo.url.getOrCrash(),
      photoDetail: PhotoDetailDTO.fromEntity(photo.photoDetail),
      timestamp: photo.timestamp.getOrCrash(),
      isFavourite: photo.isFavourite
    );
  }

  // Convert DTO to entity
  PhotoEntity toEntity() {
    return PhotoEntity(
      storagePath: StoragePath(storagePath), 
      url: URL(url),
      photoDetail: photoDetail.toEntity(),
      timestamp: Timestamp(timestamp),
      isFavourite: isFavourite 
    );
  }

  // JSON Deserializer
  factory PhotoDTO.fromJSON(Map<String, dynamic> json) {
    return PhotoDTO(
      storagePath: json['path'].toString(),
      url: json['url'].toString(),
      timestamp: parseTimestamp(json['time_taken'].toString()), 
      photoDetail: PhotoDetailDTO.fromJSON(json),
      isFavourite: json['favourite'].toString().contains('t') 
    );
  }

  static String parseTimestamp(String timestamp) {
    final String date = timestamp.substring(0, 10);
    final String time = timestamp.substring(11, timestamp.length - 5);
    final result = [date, time].join(" ");
    return result;
  }
}

@freezed
abstract class PhotoDetailDTO implements _$PhotoDetailDTO {
  const PhotoDetailDTO._();

  const factory PhotoDetailDTO({
    @required String name,
    @required double price,
    @required String comments,
  }) = _PhotoDetailDTO;

  factory PhotoDetailDTO.fromEntity(PhotoDetailEntity photoDetail) {
    return PhotoDetailDTO(
      name: photoDetail.name.getOrCrash(),
      price: photoDetail.price.getOrCrash(),
      comments: photoDetail.comments.getOrCrash()
    );
  }

  // Convert DTO to entity (domain layer)
  PhotoDetailEntity toEntity() {
    return PhotoDetailEntity(
      name: PhotoName(name),
      price: PhotoPrice(price),
      comments: PhotoComments(comments)
    );
  }

  factory PhotoDetailDTO.fromJSON(Map<String, dynamic> json) {
    return PhotoDetailDTO(
      name: json['photo_name'].toString(),
      price: double.parse(json['price'].toString()),
      comments: json['comments'].toString(),
    );
  } 
}