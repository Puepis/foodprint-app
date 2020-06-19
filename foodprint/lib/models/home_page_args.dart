
import 'package:foodprint/models/foodprint_photo.dart';
import 'package:foodprint/models/restaurant_model.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class HomePageArgs {
  final LatLng location;
  final Map<Restaurant, List<FoodprintPhoto>> userFoodprint;
  final String jwt;
  final Map<String, dynamic> payload;

  HomePageArgs(this.location, this.userFoodprint, this.jwt, this.payload);
}