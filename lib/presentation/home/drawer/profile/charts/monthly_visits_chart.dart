import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

class MonthlyVisitsChart extends StatelessWidget {
  const MonthlyVisitsChart({Key key}) : super(key: key);

  List<Color> get gradientColors => [
        const Color(0xff23b6e6),
        const Color(0xff02d39a),
      ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 175,
      width: double.infinity,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(0, 20, 10, 0),
        child: Row(
          children: [
            AspectRatio(
              aspectRatio: 1.8,
              child: LineChart(
                mainData(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> get monthAxis =>
      ['J', 'F', 'M', 'A', 'M', 'J', 'J', 'A', 'S', 'O', 'N', 'D'];

  LineChartData mainData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            color: Colors.grey,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            color: Colors.grey,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        bottomTitles: SideTitles(
          showTitles: true,
          reservedSize: 20,
          textStyle: TextStyle(
              color: axisTitleColor, fontWeight: FontWeight.bold, fontSize: 16),
          getTitles: (double value) {
            switch (value.toInt()) {
              case 1:
                return 'FEB';
              case 4:
                return 'MAY';
              case 7:
                return 'AUG';
              case 10:
                return 'NOV';
            }
            return '';
          },
          margin: 8,
        ),
        leftTitles: SideTitles(
          showTitles: true,
          textStyle: TextStyle(
            color: axisTitleColor,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
          getTitles: (value) {
            switch (value.toInt()) {
              case 1:
                return '10';
              case 3:
                return '20';
              case 5:
                return '30';
            }
            return '';
          },
          reservedSize: 16,
          margin: 10,
        ),
      ),
      borderData: FlBorderData(
          show: true,
          border: Border.all(
            color: const Color(0xff37434d),
          )),
      minX: 0,
      maxX: 11,
      minY: 0,
      maxY: 6,
      lineBarsData: [
        LineChartBarData(
          spots: [
            FlSpot(0, 3),
            FlSpot(1, 2),
            FlSpot(2, 5),
            FlSpot(3, 3),
            FlSpot(4, 4),
            FlSpot(5, 3),
            FlSpot(6, 2),
            FlSpot(7, 2),
            FlSpot(8, 3),
            FlSpot(9, 4),
            FlSpot(10, 3),
            FlSpot(11, 4),
          ],
          isCurved: true,
          colors: gradientColors,
          barWidth: 5,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: false,
          ),
          belowBarData: BarAreaData(
            show: true,
            colors:
                gradientColors.map((color) => color.withOpacity(0.3)).toList(),
          ),
        ),
      ],
    );
  }
}
