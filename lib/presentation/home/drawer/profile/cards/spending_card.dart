import 'package:flutter/material.dart';
import 'package:foodprint/presentation/profile_page_models/spending_model.dart';
import 'package:foodprint/presentation/home/drawer/profile/charts/spending_card_chart.dart';
import 'package:foodprint/presentation/home/drawer/profile/pages/spending_breakdown_page.dart';
import 'package:foodprint/presentation/home/drawer/profile/profile.dart';
import 'package:foodprint/presentation/router/spending_breakdown_page_args.dart';
import 'package:intl/intl.dart';

class SpendingCard extends StatelessWidget {
  final SpendingModel spending;
  const SpendingCard({Key key, @required this.spending}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return GestureDetector(
      onTap: () => spending.totalSpent > 0
          ? Navigator.pushNamed(context, SpendingBreakdownPage.routeName,
              arguments: SpendingBreakdownPageArgs(spending: spending))
          : null,
      child: Card(
        elevation: 5.0,
        color: Colors.white,
        margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
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
              Text(
                "You've spent a total of ${formatter.format(spending.totalSpent)}.",
                style: const TextStyle(
                  color: Colors.green,
                  fontSize: 16.0,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SpendingPieChart(
                spending: spending,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
