import 'package:flutter/material.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

class AppDrawer extends StatelessWidget {
  final JWT token;
  const AppDrawer({Key key, @required this.token}) : super(key: key);

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
                      icon: Icons.face, text: 'Profile', onTap: () {}),
                  const Divider(
                    thickness: 1.0,
                  ),
                  _createDrawerItem(
                      icon: Icons.settings, text: 'Settings', onTap: () {}),
                  _createDrawerItem(
                      icon: Icons.info, text: 'About', onTap: () {}),
                  _createDrawerItem(
                    icon: Icons.bug_report,
                    text: 'Report an issue',
                    onTap: () => null,
                  ),
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
                    'Licenses',
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
              onTap: () {},
            ),
          )
        ],
      ),
    );
  }

  Widget _header() {
    final username = JWT.getDecodedPayload(token.getOrCrash())['username'];

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
                            fontWeight: FontWeight.w500)),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, top: 10),
                child: Text("46 Photos",
                    style: GoogleFonts.montserrat(
                        color: Colors.white, fontSize: 16.0)),
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
