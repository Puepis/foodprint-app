// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'photo_dtos.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_PhotoDTO _$_$_PhotoDTOFromJson(Map<String, dynamic> json) {
  return _$_PhotoDTO(
    storagePath: json['storagePath'] as String,
    bytes: (json['bytes'] as List)?.map((e) => e as int)?.toList(),
    photoDetail: json['photoDetail'] == null
        ? null
        : PhotoDetailDTO.fromJson(json['photoDetail'] as Map<String, dynamic>),
    timestamp: json['timestamp'] as String,
  );
}

Map<String, dynamic> _$_$_PhotoDTOToJson(_$_PhotoDTO instance) =>
    <String, dynamic>{
      'storagePath': instance.storagePath,
      'bytes': instance.bytes,
      'photoDetail': instance.photoDetail,
      'timestamp': instance.timestamp,
    };

_$_PhotoDetailDTO _$_$_PhotoDetailDTOFromJson(Map<String, dynamic> json) {
  return _$_PhotoDetailDTO(
    name: json['name'] as String,
    price: (json['price'] as num)?.toDouble(),
    comments: json['comments'] as String,
  );
}

Map<String, dynamic> _$_$_PhotoDetailDTOToJson(_$_PhotoDetailDTO instance) =>
    <String, dynamic>{
      'name': instance.name,
      'price': instance.price,
      'comments': instance.comments,
    };
