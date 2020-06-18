import 'geometry.dart';
import 'photo.dart';

class Result {
  final Geometry geometry;
  final String icon;
  final String id;
  final String name;
  final List<Photo> photos;
  final String placeId;
  final double rating;
  final String reference;
  final String scope;
  final List<String> types;
  final int userRatingsTotal;
  final String vicinity;

  Result({this.geometry, this.icon, this.id, this.name, this.placeId, this.reference,
    this.scope, this.vicinity, this.types, this.photos,
    this.userRatingsTotal, this.rating});

  factory Result.fromJson(Map<String, dynamic> json){
    return Result(
      geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
      icon: json['icon'].toString(),
      id: json['id'].toString(),
      name: json['name'].toString(),
      photos: json['photos'] != null ? (json['photos'] as List<dynamic>).map<Photo>((i) =>
          Photo.fromJson(i as Map<String, dynamic>)).toList(): [],
      placeId: json['place_id'] as String,
      rating: json['rating'] != null ? double.parse(json['rating'].toString()) : -1.0,
      reference: json['reference'].toString(),
      scope: json['scope'].toString(),
      types: List<String>.from(json['types'] as List<dynamic>),
      userRatingsTotal: json['user_ratings_total'] as int,
      vicinity: json['vicinity'].toString(),
    );
  }
}