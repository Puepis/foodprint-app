import 'package:flutter/material.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/home/drawer/profile/charts/spending_chart.dart';
import 'package:intl/intl.dart';

class SpendingCard extends StatelessWidget {
  final FoodprintEntity foodprint;
  const SpendingCard({Key key, @required this.foodprint}) : super(key: key);

  double get totalSpent => foodprint.restaurantPhotos.values.fold(
      0,
      (prev, photos) =>
          prev +
          photos.fold(
              0,
              (previous, photo) =>
                  previous + photo.photoDetail.price.getOrCrash()));

  @override
  Widget build(BuildContext context) {
    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

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
              "You've spent a total of ${formatter.format(totalSpent)}.",
              style: const TextStyle(
                color: Colors.green,
                fontSize: 16.0,
                fontWeight: FontWeight.normal,
              ),
            ),
            SpendingPieChart(
              foodprint: foodprint,
              totalSpent: totalSpent,
            ),
          ],
        ),
      ),
    );
  }
}
