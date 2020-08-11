import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/home/drawer/drawer.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:foodprint/presentation/legal/legal.dart';
import 'package:foodprint/presentation/router/profile_page_args.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:transparent_image/transparent_image.dart';

/// The main drawer displayed from the home page
class AppDrawer extends StatelessWidget {
  const AppDrawer({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final userData = context.watch<UserData>();
    final token = userData.token;
    final foodprint = userData.foodprint;

    final username =
        JWT.getDecodedPayload(token.getOrCrash())['username'] as String;
    final url =
        JWT.getDecodedPayload(token.getOrCrash())['avatar_url'] as String;

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
                          context, ProfilePage.routeName,
                          arguments: ProfilePageArgs(
                              token: token, foodprint: foodprint))),
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
      decoration: BoxDecoration(color: primaryColor),
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
                    height: 65,
                    width: 65,
                    decoration: BoxDecoration(
                        color: foodprintPrimaryColorSwatch[50],
                        borderRadius: BorderRadius.circular(100)),
                    child: const Icon(
                      Icons.person_outline,
                      size: 52,
                    ),
                  )
                else
                  Container(
                    height: 65,
                    width: 65,
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
                  child: Text(username.toString(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                      style: GoogleFonts.rubik(
                          fontSize: 26.0,
                          color: Colors.black,
                          fontWeight: FontWeight.w600)),
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
                'v1.0.0',
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
            Icon(
              icon,
              size: 26.0,
              color: primaryColorDark,
            ),
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
