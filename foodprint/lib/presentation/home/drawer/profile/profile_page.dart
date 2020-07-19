import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/home/drawer/drawer.dart';
import 'package:foodprint/presentation/home/drawer/profile/stats_section.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = "/profile";
  const ProfilePage({Key key}) : super(key: key);

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
              onPressed: () =>
                  Navigator.pushNamed(context, SettingsPage.routeName),
            )
          ],
        ),
        body: Container(
          color: backgroundColor,
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              _buildHeader('Profile'),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: Container(),
                ),
              ),
              _buildHeader('Summary'),
              _buildHeader('Your Stats'),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: StatsSection(),
                ),
              ),
            ],
          ),
        ));
  }

  SliverPadding _buildHeader(String title) => SliverPadding(
        padding: const EdgeInsets.all(20.0),
        sliver: SliverToBoxAdapter(
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 35.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
