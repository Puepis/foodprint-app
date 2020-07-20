import 'package:flutter/material.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/home/drawer/profile/profile.dart';

class MonthlyVisitsCard extends StatelessWidget {
  final FoodprintEntity foodprint;
  const MonthlyVisitsCard({Key key, @required this.foodprint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      color: foodprintPrimaryColorSwatch[50],
      margin: const EdgeInsets.fromLTRB(8, 0, 8, 16),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(20.0),
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
        ),
      ),
    );
  }
}
