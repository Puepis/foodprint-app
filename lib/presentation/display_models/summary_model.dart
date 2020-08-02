import 'package:foodprint/domain/foodprint/foodprint_entity.dart';

import 'foodprint_model.dart';

class SummaryModel extends FoodprintModel {
  SummaryModel(FoodprintEntity foodprint) : super(foodprint);

  int get numLocations => restaurants.length;
  int get numFavourites => photos.where((photo) => photo.isFavourite).length;
}
