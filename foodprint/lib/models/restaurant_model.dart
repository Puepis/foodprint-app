
class Restaurant {
  final String id;
  final String name;
  final double rating;
  final double latitude;
  final double longitude;

  Restaurant({this.id, this.name, this.rating, this.latitude, this.longitude});

  factory Restaurant.fromJson(Map<String, dynamic> json) {
    return Restaurant(
      id: json['restaurant_id'].toString(),
      name: json['restaurant_name'].toString(),
      rating: double.parse(json['restaurant_rating'].toString()),
      latitude: double.parse(json['restaurant_lat'].toString()),
      longitude: double.parse(json['restaurant_lng'].toString())
    );
  }
}
