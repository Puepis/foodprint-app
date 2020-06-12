
/*
 * This model class defines the information stored with every photograph taken.
 */
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

  factory FoodprintPhoto.fromPG(dynamic photo) {
    return FoodprintPhoto(
      imgBytes: photo.data,
      name: photo.name,
      price: photo.price,
      caption: photo.caption,
      restaurantId: photo.restaurant_id,
      restaurantName: photo.restaurant_name,
      restaurantRating: photo.restaurant_rating,
      timestamp: photo.time_taken,
      latitude: photo.restaurant_lat,
      longitude: photo.restaurant_lng
    );
  }
}