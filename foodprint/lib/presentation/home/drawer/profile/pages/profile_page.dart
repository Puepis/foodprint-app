import 'package:flutter/material.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/presentation/display_models/summary_model.dart';
import 'package:foodprint/presentation/home/drawer/drawer.dart';
import 'package:foodprint/presentation/home/drawer/profile/profile.dart';
import 'package:foodprint/presentation/router/settings_page_args.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = "/profile";
  final JWT token;
  final FoodprintEntity foodprint;
  const ProfilePage({Key key, this.token, this.foodprint}) : super(key: key);

  Color get backgroundColor => foodprintPrimaryColorSwatch[300];

  @override
  Widget build(BuildContext context) {
    final username =
        JWT.getDecodedPayload(token.getOrCrash())['username'] as String;
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: backgroundColor,
          actions: [
            IconButton(
              icon: const Icon(Icons.settings),
              onPressed: () => Navigator.pushNamed(
                  context, SettingsPage.routeName,
                  arguments: SettingsPageArgs(token: token)),
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
                    username: username,
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
