import 'package:flutter/material.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

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
              color: Colors.blue,
              padding: EdgeInsets.zero,
              margin: EdgeInsets.zero,
              child: Column(
                children: [
                 _createDrawerItem(
                    icon: Icons.event,
                    text: 'Events',
                  ),
                  _createDrawerItem(
                    icon: Icons.note,
                    text: 'Notes',
                  ),
                  const Divider(),
                  _createDrawerItem(
                      icon: Icons.collections_bookmark, text: 'Steps'),
                  _createDrawerItem(icon: Icons.face, text: 'Authors'),
                  _createDrawerItem(
                      icon: Icons.account_box, text: 'Flutter Documentation'),
                  _createDrawerItem(icon: Icons.stars, text: 'Useful Links'),
                ],
              ),
            ),
          ),
          const Divider(
            thickness: 1,
            height: 1,
          ),
          _createDrawerItem(
            icon: Icons.bug_report,
            text: 'Report an issue',
            onTap: () => null,
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
                  ),
                  Text(
                    'v0.0.1',
                    style: TextStyle(
                      color: hintColor, 
                      fontWeight: FontWeight.w300
                    ),),
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
      child: Stack(
        children: [
          Positioned(
              bottom: 15.0,
              left: 16.0,
              child: Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 40,
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Text(username.toString(),
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 26.0,
                          fontWeight: FontWeight.w500)),
                ],
              )),
        ],
      ),
    );
  }

  Widget _createDrawerItem(
      {@required IconData icon,
      @required String text,
      // ignore: avoid_init_to_null
      GestureTapCallback onTap = null}) {
    return ListTile(
      title: Row(
        children: [
          Icon(icon),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(text),
          )
        ],
      ),
      onTap: onTap,
    );
  }
}
