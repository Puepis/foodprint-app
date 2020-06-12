
/*
 * This model class defines the information stored with every photograph taken.
 */

import 'package:foodprint/models/foodprint_photo.dart';

class PhotoResponse {

  final List<FoodprintPhoto> photos;
  PhotoResponse({this.photos});

  factory PhotoResponse.fromJson(Map<String, dynamic> json) {
    return PhotoResponse(
        photos: parsePhotos(json['photos'])
    );
  }

  static List<FoodprintPhoto> parsePhotos(List<dynamic> list){
    return list.map((i) => FoodprintPhoto.fromPG(i)).toList();
  }
}