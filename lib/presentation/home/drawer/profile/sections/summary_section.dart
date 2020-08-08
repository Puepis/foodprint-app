import 'package:flutter/material.dart';
import 'package:foodprint/presentation/profile_page_models/summary_model.dart';

/// Display a summary of the user's foodprint
class SummarySection extends StatelessWidget {
  final SummaryModel summary;
  const SummarySection({Key key, @required this.summary}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        _buildStatCard(
          title: summary.photos.length == 1 ? 'Photo' : 'Photos',
          count: summary.photos.length.toString(),
        ),
        _buildStatCard(
          title: summary.numLocations == 1 ? 'Location' : 'Locations',
          count: summary.numLocations.toString(),
        ),
        _buildStatCard(
          title: summary.numFavourites == 1 ? 'Favourite' : 'Favourites',
          count: summary.numFavourites.toString(),
        ),
      ],
    );
  }

  Expanded _buildStatCard({String count, String title}) => Expanded(
        child: Container(
          margin: const EdgeInsets.fromLTRB(6, 12, 6, 12),
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                count,
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Text(
                title,
                style: TextStyle(
                  color: Colors.orange.shade900,
                  fontSize: 15.0,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      );
}
