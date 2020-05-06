
/*
 * This model class defines the information stored with every photograph taken.
 */
class PhotoDetail {
  final String name;
  final double price;
  final String caption;
  final String restaurantName;
  final double rating;
  final String datetime;
  final double latitude;
  final double longitude;

  PhotoDetail(
      {this.name, this.price, this.caption, this.restaurantName, this.rating,
        this.datetime, this.latitude, this.longitude});

  factory PhotoDetail.fromJson(Map<String, dynamic> json) {
    return PhotoDetail(
        name: json['name'],
        price: json['price'].toDouble(),
        caption: json['caption'],
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
      'restaurantName': restaurantName,
      'rating': rating,
      'datetime': datetime,
      'latitude': latitude,
      'longitude': longitude
    };
}