import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/home/drawer/profile/profile.dart';

class SpendingPieChart extends StatelessWidget {
  final FoodprintEntity foodprint;
  final double totalSpent;
  const SpendingPieChart(
      {Key key, @required this.foodprint, @required this.totalSpent})
      : super(key: key);

  List<RestaurantEntity> get restaurants =>
      foodprint.restaurantPhotos.keys.toList();

  List<PhotoEntity> get photos =>
      foodprint.restaurantPhotos.values.reduce((cur, photos) {
        cur.addAll(photos);
        return cur;
      });

  /// Maps the categories to their respective colors
  Map<String, Color> get categories => {
        "cafe": _cafeColor,
        "bar": _barColor,
        "bakery": _bakeryColor,
        "restaurant": _restaurantColor
      };

  // Respective chart colours
  Color get _restaurantColor => const Color(0xff0293ee);
  Color get _bakeryColor => const Color(0xfff8b250);
  Color get _barColor => const Color(0xff845bef);
  Color get _cafeColor => const Color(0xff13d38f);

  /// Retrieves the categorical totals (money spent)
  Map<String, double> get sectionTotals {
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
    assert(res.values.fold(0, (p, c) => p + c) == totalSpent);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1,
              child: PieChart(PieChartData(
                centerSpaceRadius: double.infinity,
                borderData: FlBorderData(show: false),
                sectionsSpace: 0,
                sections: _buildChartSections(),
              )),
            ),
            const SizedBox(
              width: 40,
            ),
            _buildLegend(),
          ],
        ),
      ),
    );
  }

  /// Generates the chart's legend based on the displayed data
  Expanded _buildLegend() {
    // List of categories to display
    final sections =
        categories.keys.where((c) => sectionTotals[c] > 0).toList();
    return Expanded(
      child: Center(
        child: ListView.separated(
            shrinkWrap: true,
            itemCount: sections.length,
            separatorBuilder: (context, index) => const SizedBox(
                  height: 8,
                ),
            itemBuilder: (context, index) {
              // Get category info
              final Color color = categories[sections[index]];
              final String title = sections[index][0].toUpperCase() +
                  sections[index].substring(1);

              return Indicator(
                color: color,
                text: title,
                isSquare: true,
              );
            }),
      ),
    );
  }

  List<PieChartSectionData> _buildChartSections() {
    const double radius = 30;

    // Calculate percentages
    final Map<String, double> percentages = {
      "cafe": 0,
      "bar": 0,
      "bakery": 0,
      "restaurant": 0
    };
    if (totalSpent > 0) {
      for (final category in categories.keys) {
        percentages[category] = sectionTotals[category] / totalSpent * 100;
      }
    }

    // Generate display data
    return List.generate(4, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: _cafeColor,
            value: percentages["cafe"],
            title: '',
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: _bakeryColor,
            value: percentages["bakery"],
            radius: radius,
            title: '',
          );
        case 2:
          return PieChartSectionData(
            color: _barColor,
            value: percentages["bar"],
            title: '',
            radius: radius,
          );
        case 3:
          return PieChartSectionData(
            color: _restaurantColor,
            value: percentages["restaurant"],
            title: '',
            radius: radius,
          );
        default:
          return null;
      }
    });
  }
}
