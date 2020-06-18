
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
      storagePath: json['path'].toString(),
      imgBytes: parseImgData(json['data'].toString()),
      name: json['photo_name'].toString(),
      price: double.parse(json['price'].toString()),
      caption: json['caption'].toString(),
      restaurant: Restaurant(
        id: json['restaurant_id'].toString(),
        name: json['restaurant_name'].toString(),
        rating: double.parse(json['restaurant_rating'].toString()),
        latitude: double.parse(json['restaurant_lat'].toString()),
        longitude: double.parse(json['restaurant_lng'].toString())
      ),
      timestamp: json['time_taken'].toString(), // TODO: Parse timestamp
    );
  }

  static Uint8List parseImgData(String json) {
    final List<int> bytes = [];
    for (final byte in jsonDecode(json)) {
      bytes.add(int.parse(byte.toString()));
    }
    return Uint8List.fromList(bytes);
  }
}