import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:foodprint/presentation/home/drawer/profile/indicator.dart';

class SpendingPieChart extends StatelessWidget {
  const SpendingPieChart({Key key}) : super(key: key);

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
                sections: showingSections(),
              )),
            ),
            const SizedBox(width: 40,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Indicator(
                    color: Color(0xff0293ee),
                    text: 'First',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Indicator(
                    color: Color(0xfff8b250),
                    text: 'Second',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Indicator(
                    color: Color(0xff845bef),
                    text: 'Third',
                    isSquare: true,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Indicator(
                    color: Color(0xff13d38e),
                    text: 'Fourth',
                    isSquare: true,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<PieChartSectionData> showingSections() {
    return List.generate(4, (i) {
      const double fontSize = 16;
      const double radius = 30;
      switch (i) {
        case 0:
          return PieChartSectionData(
            color: const Color(0xff0293ee),
            value: 40,
            title: '',
            radius: radius,
            titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          );
        case 1:
          return PieChartSectionData(
            color: const Color(0xfff8b250),
            value: 30,
            radius: radius,
            title: '',
            titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          );
        case 2:
          return PieChartSectionData(
            color: const Color(0xff845bef),
            value: 15,
            title: '',
            radius: radius,
            titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          );
        case 3:
          return PieChartSectionData(
            color: const Color(0xff13d38e),
            value: 15,
            title: '',
            radius: radius,
            titleStyle: const TextStyle(
                fontSize: fontSize,
                fontWeight: FontWeight.bold,
                color: Color(0xffffffff)),
          );
        default:
          return null;
      }
    });
  }
}
