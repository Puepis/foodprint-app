import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/core/styles/gradients.dart';
import 'package:foodprint/presentation/home/drawer/drawer.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:foodprint/presentation/legal/legal.dart';
import 'package:foodprint/presentation/router/profile/profile_navigator_args.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

import 'profile/navigator.dart';

/// The main drawer displayed from the home page
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserData>();
    final token = userData.token;

    final username = token.username;
    final url = token.avatar_url;

    return Drawer(
      child: Column(
        children: [
          _buildHeader(username, url),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  _createDrawerItem(
                      icon: Icons.person,
                      text: 'Profile',
                      onTap: () => Navigator.popAndPushNamed(
                          context, ProfileNavigator.routeName,
                          arguments: ProfileNavigatorArgs(userData: userData))),
                  _createDrawerItem(
                    icon: Icons.bug_report,
                    text: 'Report an issue',
                    onTap: () => Navigator.popAndPushNamed(
                        context, ReportIssuePage.routeName),
                  ),
                  _createDrawerItem(
                      icon: Icons.exit_to_app,
                      text: 'Sign out',
                      onTap: () => context
                          .bloc<AuthBloc>()
                          .add(const AuthEvent.loggedOut())),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            height: 1,
          ),
          _buildLegal(context)
        ],
      ),
    );
  }

  /// Build the drawer header
  Widget _buildHeader(String username, String url) => DrawerHeader(
      margin: EdgeInsets.zero,
      padding: EdgeInsets.zero,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.bottomLeft,
              colors: sweetMorningGradient.reversed.toList())),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                if (url == null)
                  Container(
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        color: foodprintPrimaryColorSwatch[50],
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      Icons.person_outline,
                      size: 48,
                    ),
                  )
                else
                  Container(
                    height: 60,
                    width: 60,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CachedNetworkImage(
                          fit: BoxFit.cover,
                          fadeInDuration: const Duration(milliseconds: 150),
                          placeholder: (context, url) =>
                              Image.memory(kTransparentImage),
                          imageUrl: url),
                    ),
                  ),
                const SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomLeft,
                    child: Text(username.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26,
                          fontWeight: FontWeight.w500,
                        )),
                  ),
                ),
              ],
            ),
          ],
        ),
      ));

  /// Builds the tile that is shown at the bottom of the drawer
  Padding _buildLegal(BuildContext context) => Padding(
        padding: const EdgeInsets.only(top: 7.0, bottom: 7.0),
        child: ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Legal',
                style: TextStyle(fontSize: 15.0),
              ),
              Text(
                'v2.0.1',
                style: TextStyle(
                    fontSize: 15.0,
                    color: hintColor,
                    fontWeight: FontWeight.w300),
              ),
            ],
          ),
          dense: true,
          onTap: () => Navigator.pushNamed(context, LegalPage.routeName),
        ),
      );

  Widget _createDrawerItem(
          {@required IconData icon,
          @required String text,
          GestureTapCallback onTap}) =>
      ListTile(
        title: Row(
          children: [
            Icon(icon, size: 26.0, color: foodprintPrimaryColorSwatch[400]),
            const SizedBox(
              width: 20,
            ),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16.0,
              ),
            ),
          ],
        ),
        onTap: onTap,
      );
}
