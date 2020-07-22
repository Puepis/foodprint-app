import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/presentation/display_models/spending_model.dart';

class BreakdownChart extends StatelessWidget {
  final SpendingModel spending;
  final List<Color> colors;
  const BreakdownChart(
      {Key key,
      @required this.spending,
      @required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(
        PieChartData(
        centerSpaceRadius: 100,
        borderData: FlBorderData(show: false),
        sectionsSpace: 0,
        sections: _buildChartSections(),
      )),
    );
  }

  List<PieChartSectionData> _buildChartSections() {
    const double radius = 35;
    final percentages = spending.percentages;

    // Generate display data
    return List.generate(4, (i) {
      final color = colors[i];
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: color,
            value: percentages["cafe"],
            title: '',
            radius: radius,
          );
        case 1:
          return PieChartSectionData(
            color: color,
            value: percentages["bar"],
            title: '',
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: color,
            value: percentages["bakery"],
            radius: radius,
            title: '',
          );
        case 3:
          return PieChartSectionData(
            color: color,
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
