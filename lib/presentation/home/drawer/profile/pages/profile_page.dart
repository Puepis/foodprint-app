import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:foodprint/presentation/profile_page_models/summary_model.dart';
import 'package:foodprint/presentation/home/drawer/profile/profile.dart';
import 'package:foodprint/presentation/home/edit_profile/edit_profile.dart';

class ProfilePage extends StatelessWidget {
  final UserData userData;
  static const routeName = "/profile_page";
  const ProfilePage({Key key, @required this.userData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: Profile.routeName,
      onGenerateRoute: (settings) {
        WidgetBuilder builder;
        switch (settings.name) {
          case Profile.routeName:
            builder = (_) => Profile(
                userData: userData, onFinished: () => Navigator.pop(context));
            break;
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
        return MaterialPageRoute(builder: builder, settings: settings);
      },
    );
  }
}

/// Displays the user's stats in a visually appealing and organized manner.
class Profile extends StatelessWidget {
  static const String routeName = "profile/";
  final UserData userData;
  final VoidCallback onFinished;
  const Profile({Key key, @required this.userData, @required this.onFinished})
      : super(key: key);

  Color get backgroundColor => foodprintPrimaryColorSwatch[300];

  @override
  Widget build(BuildContext context) {
    final foodprint = userData.foodprint;

    return Scaffold(
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
                      onUsernameChange: onFinished,
                    ),
                  )),
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
          ),
        ));
  }
}
