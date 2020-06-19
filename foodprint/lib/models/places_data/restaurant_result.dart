
// TODO: Use this as main restaurant class
class RestaurantResult {
  final String formattedAddress;
  final String icon;
  final String name;
  final String placeId;
  final double rating;
  final List<String> types;
  final int userRatingsTotal;
  final int priceLevel;
  final double lat;
  final double lng;

  RestaurantResult({this.icon, this.name, this.placeId, this.formattedAddress,
    this.types, this.priceLevel, this.userRatingsTotal, this.rating, this.lat, this.lng});

  factory RestaurantResult.fromJson(Map<String, dynamic> json){
    return RestaurantResult(
      formattedAddress: json['formatted_address'].toString(),
      icon: json['icon'].toString(),
      name: json['name'].toString(),
      placeId: json['place_id'] as String,
      rating: json['rating'] != null ? double.parse(json['rating'].toString()) : -1.0,
      types: List<String>.from(json['types'] as List),
      userRatingsTotal: json['user_ratings_total'] as int,
      priceLevel: json['price_level'] as int,
      lat: json['geometry']['location']['lat'] as double,
      lng: json['geometry']['location']['lng'] as double
    );
  }
}