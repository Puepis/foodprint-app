import 'package:flutter/material.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/profile_page_models/spending_model.dart';
import 'package:foodprint/presentation/home/drawer/profile/charts/spending_breakdown_chart.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class SpendingBreakdownPage extends StatefulWidget {
  final SpendingModel spending;
  static const routeName = "/spending_breakdown";
  const SpendingBreakdownPage({Key key, @required this.spending})
      : super(key: key);

  @override
  _SpendingBreakdownPageState createState() => _SpendingBreakdownPageState();
}

class _SpendingBreakdownPageState extends State<SpendingBreakdownPage> {
  // ignore: prefer_final_fields
  int _index = 0;

  /// Generate the spending breakdown for a specific category
  Map<RestaurantEntity, List<PhotoEntity>> _getBreakdown() {
    final String category = widget.spending.displaySections[_index];

    // Make a copy of the foodprint and filter by category
    final Map<RestaurantEntity, List<PhotoEntity>> filtered =
        Map.from(widget.spending.foodprint.restaurantPhotos);
    filtered.removeWhere(
        (key, value) => !key.types.getOrCrash().contains(category));
    return filtered;
  }

  @override
  Widget build(BuildContext context) {
    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    // Number of categories with a non-zero value spent
    final int numSections = widget.spending.displaySections.length;

    // The current category to display
    final String category = widget.spending.displaySections[_index];

    // Color that has focus in the pie chart
    final Color focusColor = widget.spending.categoryColors[category];

    final String title = widget.spending.displayTitles[_index];

    // Total amount spent in [category]
    final double spent = widget.spending.categoryTotals[category];

    // Percentage of total to display, rounded to 2 decimal places
    final String percentage =
        widget.spending.percentages[category].toStringAsFixed(2);

    // Colors to display in the breakdown chart
    final colors = widget.spending.displayHiddenColors;
    colors[_index] = focusColor;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Spending Breakdown",
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: 325,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  _buildHeader(title, formatter, spent, focusColor, percentage),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                        onTap: () => _index > 0
                            ? setState(() {
                                _index -= 1;
                              })
                            : null,
                        child: const Icon(
                          Icons.chevron_left,
                          size: 30,
                        ),
                      ),
                      InkWell(
                        onTap: () => _index < numSections - 1
                            ? setState(() {
                                _index += 1;
                              })
                            : null,
                        child: const Icon(
                          Icons.chevron_right,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.all(25.0),
                    child: BreakdownChart(
                      spending: widget.spending,
                      colors: colors,
                    ),
                  ),
                ],
              ),
            ),
            BreakdownDetails(
              breakdown: _getBreakdown(),
              type: title,
            ),
          ],
        ),
      ),
    );
  }

  /// Constructs the category header displayed in the middle of the chart
  Column _buildHeader(String title, NumberFormat formatter, double spent,
      Color color, String percentage) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          title,
          style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.w600),
        ),
        const SizedBox(
          height: 5,
        ),
        Text(formatter.format(spent),
            style: GoogleFonts.rubik(
              color: color,
              fontSize: 32.0,
              fontWeight: FontWeight.w600,
            )),
        const SizedBox(
          height: 5,
        ),
        Text(
          "$percentage% of Total",
          style: const TextStyle(fontSize: 14.0, color: Colors.grey),
        )
      ],
    );
  }
}

/// Displays the restaurants that are part of the category
class BreakdownDetails extends StatelessWidget {
  const BreakdownDetails({
    Key key,
    @required this.type,
    @required this.breakdown,
  }) : super(key: key);

  final String type;
  final Map<RestaurantEntity, List<PhotoEntity>> breakdown;

  @override
  Widget build(BuildContext context) {
    // Details
    final int numRestaurants = breakdown.keys.length;
    final restaurants = breakdown.keys.toList();

    // Currency formatter
    final NumberFormat formatter = NumberFormat.simpleCurrency(
        locale: Localizations.localeOf(context).toString());

    return Container(
      decoration: BoxDecoration(color: foodprintPrimaryColorSwatch[50]),
      child: Column(
        children: [
          ListTile(
            title: Text(
              '$numRestaurants $type${numRestaurants > 1 ? 's' : ''}',
              style:
                  const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
            ),
          ),
          const Divider(
            height: 1,
            color: Colors.grey,
          ),
          ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: numRestaurants,
            separatorBuilder: (context, index) => const Divider(
              height: 1,
              color: Colors.grey,
            ),
            itemBuilder: (context, index) {
              final restaurant = restaurants[index];
              final numPhotos = breakdown[restaurant].length;
              final totalPrice = breakdown[restaurant].fold(
                  0, (prev, photo) => prev + photo.details.price.getOrCrash());

              return ListTile(
                title: Row(
                  children: [
                    Expanded(child: Text(restaurant.name.getOrCrash())),
                    Text(formatter.format(totalPrice)),
                  ],
                ),
                subtitle: Text("$numPhotos Photo${numPhotos == 1 ? '' : 's'}"),
              );
            },
          )
        ],
      ),
    );
  }
}
