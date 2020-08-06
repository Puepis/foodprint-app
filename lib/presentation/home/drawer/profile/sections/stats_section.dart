import 'package:flutter/material.dart';
import 'package:foodprint/presentation/profile_page_models/spending_model.dart';
import 'package:foodprint/presentation/home/drawer/profile/cards/spending_card.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/presentation/home/drawer/profile/profile.dart';

class StatsSection extends StatelessWidget {
  final FoodprintEntity foodprint;
  const StatsSection({Key key, @required this.foodprint}) : super(key: key);

  @override
  Widget build(BuildContext context) => Column(
        children: [
          SpendingCard(
            spending: SpendingModel(foodprint),
          ),
        ],
      );
}
