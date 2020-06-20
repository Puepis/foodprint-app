
/*
 * This model class defines the information stored with every photograph taken.
 */
import 'dart:convert';
import 'dart:typed_data';

import 'package:path/path.dart';

class FoodprintPhoto {
  final String storagePath; // unique identifier
  Uint8List imgBytes;
  final String name;
  final double price;
  final String caption;
  final String restaurantId;
  final String timestamp;

  FoodprintPhoto({this.restaurantId, this.storagePath, this.imgBytes, this.name,
    this.price, this.caption, this.timestamp}
  );

  factory FoodprintPhoto.fromPG(Map<String, dynamic> json) {
    return FoodprintPhoto(
      storagePath: json['path'].toString(),
      imgBytes: parseImgData(json['data'].toString()),
      name: json['photo_name'].toString(),
      price: double.parse(json['price'].toString()),
      caption: json['caption'].toString(),
      restaurantId: json['restaurant_id'].toString(),
      timestamp: parseTimestamp(json['time_taken'].toString()),
    );
  }

  static String parseTimestamp(String timestamp) {
    final String date = timestamp.substring(0, 10);
    final String time = timestamp.substring(11, timestamp.length - 5);
    final result = [date, time].join(" ");
    print(result);
    return result;
  }

  // Convert String to Uint8List
  static Uint8List parseImgData(String json) {
    final List<int> bytes = [];
    for (final byte in jsonDecode(json)) {
      bytes.add(int.parse(byte.toString()));
    }
    return Uint8List.fromList(bytes);
  }
}