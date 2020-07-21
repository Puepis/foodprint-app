import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/presentation/display_models/spending_model.dart';

class BreakdownChart extends StatelessWidget {
  final SpendingModel spending;
  const BreakdownChart({Key key, @required this.spending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 325,
      padding: const EdgeInsets.symmetric(vertical: 30),
      width: double.infinity,
      child: AspectRatio(
        aspectRatio: 1,
        child: PieChart(PieChartData(
          centerSpaceRadius: double.infinity,
          borderData: FlBorderData(show: false),
          sectionsSpace: 0,
          sections: _buildChartSections(),
        )),
      ),
    );
  }

  List<PieChartSectionData> _buildChartSections() {
    const double radius = 35;
    final percentages = spending.percentages;

    // Generate display data
    return List.generate(4, (i) {
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: spending.cafeColor,
            value: percentages["cafe"],
            title: '',
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: spending.bakeryColor,
            value: percentages["bakery"],
            radius: radius,
            title: '',
          );
        case 2:
          return PieChartSectionData(
            color: spending.barColor,
            value: percentages["bar"],
            title: '',
            radius: radius,
          );
        case 3:
          return PieChartSectionData(
            color: spending.restaurantColor,
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
