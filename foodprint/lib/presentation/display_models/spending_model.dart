import 'package:flutter/material.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';

import 'foodprint_model.dart';

/// Contains the logic for calculating the user's spending
class SpendingModel extends FoodprintModel {
  SpendingModel(FoodprintEntity foodprint) : super(foodprint);

  double get totalSpent => foodprint.restaurantPhotos.values.fold(
      0,
      (prev, photos) =>
          prev +
          photos.fold(
              0,
              (previous, photo) =>
                  previous + photo.photoDetail.price.getOrCrash()));

  /// Maps the categories to their respective colors
  Map<String, Color> get categoryColors => {
        "cafe": cafeColor,
        "bar": barColor,
        "bakery": bakeryColor,
        "restaurant": restaurantColor
      };

  List<String> get categories => ["cafe", "bar", "bakery", "restaurant"];
  List<String> get allTitles => ["Cafe", "Bar", "Bakery", "Restaurant"];

  /// Categories to display
  List<String> get displaySections =>
      categories.where((c) => categoryTotals[c] > 0).toList();

  List<String> get displayTitles {
    final List<String> result = [];
    for (final str in displaySections) {
      result.add(str[0].toUpperCase() + str.substring(1));
    }
    return result;
  }

  /// Respective chart colours
  Color get cafeColor => const Color(0xFFFC6C84);
  Color get barColor => const Color(0xFFFDB876);
  Color get bakeryColor => const Color(0xFF58D8A1);
  Color get restaurantColor => const Color(0xFF518FFD);
  List<Color> get focusColors =>
      [cafeColor, barColor, bakeryColor, restaurantColor];

  /// Displayed in the breakdown chart
  Color get hideCafeColor => Colors.red.shade50;
  Color get hideBarColor => Colors.orange.shade50;
  Color get hideBakeryColor => Colors.green.shade50;
  Color get hideRestaurantColor => Colors.blue.shade50;
  List<Color> get hiddenColors =>
      [hideCafeColor, hideBarColor, hideBakeryColor, hideRestaurantColor];

  /// Retrieves the categorical totals (money spent)
  Map<String, double> get categoryTotals {
    final Map<String, double> res = {
      "cafe": 0,
      "restaurant": 0,
      "bar": 0,
      "bakery": 0
    };
    for (final restaurant in restaurants) {
      // Calculate the total spent at [restaurant]
      final List<PhotoEntity> photos = foodprint.restaurantPhotos[restaurant];
      final double restaurantTotal = photos.fold(
          0, (prev, cur) => prev + cur.photoDetail.price.getOrCrash());

      final types = restaurant.types.getOrCrash();
      // Check restaurant type and update accordingly
      if (types.contains("bar")) {
        res["bar"] = res.update("bar", (value) => value + restaurantTotal);
      } else if (types.contains("bakery")) {
        res["bakery"] =
            res.update("bakery", (value) => value + restaurantTotal);
      } else if (types.contains("cafe")) {
        res["cafe"] = res.update("cafe", (value) => value + restaurantTotal);
      } else {
        res["restaurant"] =
            res.update("restaurant", (value) => value + restaurantTotal);
      }
    }
    assert(res.values.fold(0, (p, c) => p + c).toStringAsFixed(2) ==
        totalSpent.toStringAsFixed(2));
    return res;
  }

// Calculate percentages
  Map<String, double> get percentages {
    final Map<String, double> res = {
      "cafe": 0,
      "bar": 0,
      "bakery": 0,
      "restaurant": 0
    };

    if (totalSpent > 0) {
      for (final category in categories) {
        res[category] = categoryTotals[category] / totalSpent * 100;
      }
    }
    return res;
  }
}
