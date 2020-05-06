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
      geometry: Geometry.fromJson(json['geometry']),
      icon: json['icon'],
      id: json['id'],
      name: json['name'],
      photos: json['photos'] != null ? json['photos'].map<Photo>((i) => Photo.fromJson(i)).toList(): [],
      placeId: json['place_id'],
      rating: json['rating'] != null ? json['rating'].toDouble(): -1.0,
      reference: json['reference'],
      scope: json['scope'],
      types: List<String>.from(json['types']),
      userRatingsTotal: json['user_ratings_total'],
      vicinity: json['vicinity'],
    );
  }
}