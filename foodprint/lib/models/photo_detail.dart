
/*
 * This model class defines the information stored with every photograph taken.
 */
class PhotoDetail {
  final String name;
  // Get all the stored photos
  final double price;
  final String caption;
  final String restaurantId;
  final String restaurantName;
  final double rating;
  final String datetime;
  final double latitude;
  final double longitude;

  PhotoDetail({this.name, this.price, this.caption, this.restaurantId,
    this.restaurantName, this.rating, this.datetime, this.latitude, this.longitude}
  );

  factory PhotoDetail.fromJson(Map<String, dynamic> json) {
    return PhotoDetail(
        name: json['name'],
        price: json['price'].toDouble(),
        caption: json['caption'],
        restaurantId: json['restaurantId'],
        restaurantName: json['restaurantName'],
        rating: json['rating'].toDouble(),
        datetime: json['datetime'],
        latitude: json['latitude'].toDouble(),
        longitude: json['longitude'].toDouble()
    );
  }

  Map<String, dynamic> toJson() =>
    {
      'name': name,
      'price': price,
      'caption': caption,
      'restaurantId': restaurantId,
      'restaurantName': restaurantName,
      'rating': rating,
      'datetime': datetime,
      'latitude': latitude,
      'longitude': longitude
    };
}