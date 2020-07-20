import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/home/drawer/profile/charts/monthly_visits_chart.dart';
import 'package:foodprint/presentation/home/drawer/profile/charts/spending_chart.dart';

class StatsSection extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        _buildMonthlyVisitsCard(),
        _buildSpendingCard(),
      ],
    );
  }

  Widget _buildDataCard({@required Widget child}) {
    return Card(
      elevation: 5.0,
      color: foodprintPrimaryColorSwatch[50],
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: child,
      ),
    );
  }

  Widget _buildMonthlyVisitsCard() {
    return _buildDataCard(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Monthly Visits",
              style: TextStyle(
                color: Colors.black,
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            const MonthlyVisitsChart(),
          ],
        ));
  }

  Widget _buildSpendingCard() {
    return _buildDataCard(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: const [
              Text(
                "Total Spending",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Icon(
                Icons.arrow_forward_ios,
              )
            ],
          ),
          const SizedBox(
            height: 5.0,
          ),
          const Text(
            "You've spent a total of \$26.23.",
            style: TextStyle(
              color: Colors.green,
              fontSize: 16.0,
              fontWeight: FontWeight.normal,
            ),
          ),
          const SpendingPieChart(),
        ],
      ),
    );
  }
}
