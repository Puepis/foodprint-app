import 'package:flutter/material.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/presentation/profile_page_models/summary_model.dart';
import 'package:foodprint/presentation/home/drawer/profile/profile.dart';
import 'package:foodprint/presentation/home/edit_profile/edit_profile.dart';
import 'package:foodprint/presentation/router/edit_profile_args.dart';

/// Displays the user's stats in a visually appealing and organized manner.
class ProfilePage extends StatelessWidget {
  static const String routeName = "/profile";
  final JWT token;
  final FoodprintEntity foodprint;
  const ProfilePage({Key key, this.token, this.foodprint}) : super(key: key);

  Color get backgroundColor => foodprintPrimaryColorSwatch[300];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: backgroundColor,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Navigator.pushNamed(
                  context, EditProfilePage.routeName,
                  arguments: EditProfileArgs(token: token)),
            )
          ],
        ),
        body: Container(
          color: backgroundColor,
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: UserSection(
                    token: token,
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: SummarySection(
                    summary: SummaryModel(foodprint),
                  ),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: StatsSection(
                    foodprint: foodprint,
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
