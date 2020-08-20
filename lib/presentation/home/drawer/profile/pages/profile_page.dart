import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/gradients.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:foodprint/presentation/profile_page_models/summary_model.dart';
import 'package:foodprint/presentation/home/drawer/profile/profile.dart';
import 'package:foodprint/presentation/home/edit_profile/edit_profile.dart';
import 'package:provider/provider.dart';

/// Displays the user's stats in a visually appealing and organized manner.
class ProfilePage extends StatelessWidget {
  static const String routeName = "profile/";
  final VoidCallback onFinished;
  const ProfilePage({Key key, @required this.onFinished}) : super(key: key);

  Color get backgroundColor => Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserData>();
    final foodprint = userData.foodprint;

    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
        begin: Alignment.topRight,
        end: Alignment.bottomLeft,
        colors: sweetMorningGradient.reversed.toList(),
      )),
      child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: backgroundColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: () => onFinished,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () =>
                    Navigator.pushNamed(context, EditProfilePage.routeName),
              )
            ],
          ),
          body: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: UserSection(
                    userData: userData,
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
          )),
    );
  }
}
