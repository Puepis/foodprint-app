import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/gradients.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:foodprint/presentation/profile_page_models/summary_model.dart';
import 'package:foodprint/presentation/home/drawer/profile/profile.dart';
import 'package:foodprint/presentation/home/edit_profile/edit_profile.dart';

/// Displays the user's stats in a visually appealing and organized manner.
class ProfilePage extends StatelessWidget {
  static const String routeName = "profile/";
  final UserData userData;
  final VoidCallback onFinished;
  const ProfilePage(
      {Key key, @required this.userData, @required this.onFinished})
      : super(key: key);

  Color get backgroundColor => Colors.transparent;

  @override
  Widget build(BuildContext context) {
    final foodprint = userData.foodprint;

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: citrusGradient,
        ),
      ),
      child: Scaffold(
          backgroundColor: backgroundColor,
          appBar: AppBar(
            elevation: 0.0,
            backgroundColor: backgroundColor,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back),
              onPressed: onFinished,
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.settings),
                onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => EditProfilePage(
                        userData: userData,
                      ),
                    )),
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
                    onAvatarChange: onFinished,
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
