
/*
 * This model class defines the information stored with every photograph taken.
 */
import 'dart:convert';
import 'dart:typed_data';

class FoodprintPhoto {
  final String storagePath;
  final Uint8List imgBytes;
  final String name;
  final double price;
  final String caption;
  final String restaurantId;
  final String restaurantName;
  final double restaurantRating;
  final String timestamp;
  final double latitude;
  final double longitude;

  FoodprintPhoto({this.storagePath, this.imgBytes, this.name, this.price, this.caption, this.restaurantId,
    this.restaurantName, this.restaurantRating, this.timestamp, this.latitude, this.longitude}
  );

  factory FoodprintPhoto.fromPG(Map<String, dynamic> json) {
    return FoodprintPhoto(
      imgBytes: castImgData(json['data']),
      name: json['photo_name'],
      price: double.parse(json['price']),
      caption: json['caption'],
      restaurantId: json['restaurant_id'],
      restaurantName: json['restaurant_name'],
      restaurantRating: double.parse(json['restaurant_rating']),
      timestamp: json['time_taken'], // TODO: Parse timestamp
      latitude: double.parse(json['restaurant_lat']),
      longitude: double.parse(json['restaurant_lng'])
    );
  }

  // Manually cast String to Uint8List
  static Uint8List castImgData(String json) {
    List<int> bytes = [];
    List<dynamic> decoded = jsonDecode(json);
    for (final byte in decoded) {
      bytes.add(byte);
    }
    return Uint8List.fromList(bytes);
  }
}