import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/presentation/profile_page_models/spending_model.dart';

class BreakdownChart extends StatelessWidget {
  final SpendingModel spending;
  final List<Color> colors;
  const BreakdownChart(
      {Key key, @required this.spending, @required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: PieChart(PieChartData(
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
    final sections = spending.displaySections;

    // Generate display data
    return List.generate(colors.length, (i) {
      return PieChartSectionData(
          color: colors[i],
          value: percentages[sections[i]],
          title: '',
          radius: radius);
    });
  }
}
