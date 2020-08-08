import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/profile_page_models/spending_model.dart';
import 'package:foodprint/presentation/home/drawer/profile/profile.dart';

/// The chart that is displayed in the profile spending card
class SpendingPieChart extends StatelessWidget {
  final SpendingModel spending;
  const SpendingPieChart({Key key, @required this.spending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return Container(
        height: constraints.maxWidth * 0.50,
        width: constraints.maxWidth,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(10, 20, 10, 0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: PieChart(PieChartData(
                  centerSpaceRadius: double.infinity,
                  borderData: FlBorderData(show: false),
                  sectionsSpace: 0,
                  sections: _buildChartSections(constraints),
                )),
              ),
              _buildLegend(constraints),
            ],
          ),
        ),
      );
    });
  }

  /// Generates the chart's legend based on the displayed data
  Widget _buildLegend(BoxConstraints constraints) {
    final sections = spending.displaySections;
    return Container(
      width: constraints.maxWidth * 0.40,
      child: ListView.separated(
          shrinkWrap: true,
          itemCount: sections.length,
          separatorBuilder: (context, index) => const SizedBox(
                height: 8,
              ),
          itemBuilder: (context, index) {
            return Indicator(
              color: spending.categoryColors[sections[index]],
              text: spending.displayTitles[index],
              isSquare: true,
            );
          }),
    );
  }

  List<PieChartSectionData> _buildChartSections(BoxConstraints constraints) {
    final radius = constraints.maxWidth * 0.08;
    final percentages = spending.percentages;

    // Default chart
    if (spending.totalSpent == 0) {
      return [
        PieChartSectionData(
            color: primaryColor, value: 100, title: '', radius: radius)
      ];
    }

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
            color: spending.barColor,
            value: percentages["bar"],
            title: '',
            radius: radius,
          );
        case 2:
          return PieChartSectionData(
            color: spending.bakeryColor,
            value: percentages["bakery"],
            radius: radius,
            title: '',
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
