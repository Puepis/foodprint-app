import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/home/drawer/profile/app_bar.dart';
import 'package:foodprint/presentation/home/drawer/profile/stats_grid.dart';

class ProfilePage extends StatelessWidget {
  static const String routeName = "/profile";
  const ProfilePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const ProfileAppBar(),
        body: Container(
          color: foodprintPrimaryColorSwatch[600],
          child: CustomScrollView(
            physics: const ClampingScrollPhysics(),
            slivers: [
              _buildHeader(),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                sliver: SliverToBoxAdapter(
                  child: StatsGrid(),
                ),
              )
            ],
          ),
        ));
  }

  SliverPadding _buildHeader() => const SliverPadding(
        padding: EdgeInsets.all(20.0),
        sliver: SliverToBoxAdapter(
          child: Text(
            'Statistics',
            style: TextStyle(
              color: Colors.white,
              fontSize: 25.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      );
}
