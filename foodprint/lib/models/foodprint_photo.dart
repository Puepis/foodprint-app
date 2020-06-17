
/*
 * This model class defines the information stored with every photograph taken.
 */
import 'dart:convert';
import 'dart:typed_data';
import 'package:foodprint/models/restaurant_model.dart';

class FoodprintPhoto {
  final String storagePath; // unique identifier
  Uint8List imgBytes;
  final String name;
  final double price;
  final String caption;
  final Restaurant restaurant;
  final String timestamp;

  FoodprintPhoto({this.restaurant, this.storagePath, this.imgBytes, this.name,
    this.price, this.caption, this.timestamp}
  );

  factory FoodprintPhoto.fromPG(Map<String, dynamic> json) {
    return FoodprintPhoto(
      storagePath: json['path'],
      imgBytes: parseImgData(json['data']),
      name: json['photo_name'],
      price: double.parse(json['price']),
      caption: json['caption'],
      restaurant: Restaurant(
        id: json['restaurant_id'],
        name: json['restaurant_name'],
        rating: double.parse(json['restaurant_rating']),
        latitude: double.parse(json['restaurant_lat']),
        longitude: double.parse(json['restaurant_lng'])
      ),
      timestamp: json['time_taken'], // TODO: Parse timestamp
    );
  }

  // Manually cast String to Uint8List
  static Uint8List parseImgData(String json) {
    List<int> bytes = [];
    List<dynamic> decoded = jsonDecode(json);
    for (final byte in decoded) {
      bytes.add(byte);
    }

    return Uint8List.fromList(bytes);
  }
}