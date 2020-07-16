import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodprint/application/auth/auth_bloc.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/core/value_transformers.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';
import 'package:foodprint/domain/photos/photo_entity.dart';
import 'package:foodprint/domain/restaurants/restaurant_entity.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/home/drawer/drawer.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  final JWT token;
  final FoodprintEntity foodprint;
  const AppDrawer({Key key, @required this.token, @required this.foodprint})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          _header(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 10),
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                  _createDrawerItem(
                      icon: Icons.face,
                      text: 'Profile',
                      onTap: () {
                        Navigator.popAndPushNamed(
                            context, ProfilePage.routeName);
                      }),
                  _createDrawerItem(
                      icon: Icons.settings,
                      text: 'Settings',
                      onTap: () {
                        Navigator.popAndPushNamed(
                            context, SettingsPage.routeName);
                      }),
                  const Divider(
                    thickness: 1.0,
                  ),
                  _createDrawerItem(
                      icon: Icons.info,
                      text: 'About',
                      onTap: () {
                        Navigator.popAndPushNamed(context, AboutPage.routeName);
                      }),
                  _createDrawerItem(
                    icon: Icons.bug_report,
                    text: 'Report an issue',
                    onTap: () {
                      Navigator.popAndPushNamed(
                          context, ReportIssuePage.routeName);
                    },
                  ),
                  _createDrawerItem(
                      icon: Icons.exit_to_app,
                      text: 'Sign Out',
                      onTap: () {
                        context
                            .bloc<AuthBloc>()
                            .add(AuthEvent.loggedOut(token));
                      }),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            height: 1,
          ),
          Padding(
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
              onTap: () {
                Navigator.pushNamed(context, LegalPage.routeName);
              },
            ),
          )
        ],
      ),
    );
  }

  Widget _header() {
    final username = JWT.getDecodedPayload(token.getOrCrash())['username'];

    final List<Tuple2<PhotoEntity, RestaurantEntity>> photos =
        getPhotosFromFoodprint(foodprint);

    return DrawerHeader(
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
                  const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Text(username.toString(),
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                        style: GoogleFonts.montserrat(
                            fontSize: 26.0,
                            color: Colors.white,
                            fontWeight: FontWeight.w600)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 10),
                child: Text("${photos.length} Photos",
                    style: GoogleFonts.montserrat(
                        color: Colors.white,
                        fontSize: 16.0,
                        fontWeight: FontWeight.w600)),
              ),
            ],
          ),
        ));
  }

  Widget _createDrawerItem(
      {@required IconData icon,
      @required String text,
      // ignore: avoid_init_to_null
      GestureTapCallback onTap = null}) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26.0,
        color: primaryColorDark,
      ),
      title: Text(
        text,
        style: const TextStyle(
          fontSize: 16.0,
        ),
      ),
      onTap: onTap,
    );
  }
}
