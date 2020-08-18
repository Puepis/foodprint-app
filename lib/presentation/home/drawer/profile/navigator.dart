import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/data/user_data.dart';
import 'package:foodprint/presentation/home/edit_profile/edit_profile.dart';
import 'package:foodprint/presentation/router/profile/spending_breakdown_page_args.dart';

import 'pages/profile_page.dart';
import 'pages/spending_breakdown_page.dart';

class ProfileNavigator extends StatefulWidget {
  final UserData userData;
  static const routeName = "/profile_page";
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  ProfileNavigator({Key key, @required this.userData}) : super(key: key);

  @override
  _ProfileNavigatorState createState() => _ProfileNavigatorState();
}

class _ProfileNavigatorState extends State<ProfileNavigator> {
  Future<bool> didPopRoute() async {
    final NavigatorState navigator = widget.navigatorKey.currentState;
    assert(navigator != null);
    return navigator.maybePop();
  }

  void onCancelRoute() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return !await didPopRoute();
      },
      child: Navigator(
        key: widget.navigatorKey,
        initialRoute: ProfilePage.routeName,
        onGenerateRoute: (settings) {
          final args = settings.arguments;
          WidgetBuilder builder;
          switch (settings.name) {
            case ProfilePage.routeName:
              builder = (_) => ProfilePage(
                  userData: widget.userData, onFinished: onCancelRoute);
              break;
            case SpendingBreakdownPage.routeName:
              if (args is SpendingBreakdownPageArgs) {
                return SlideLeftRoute(
                    newPage: SpendingBreakdownPage(
                  spending: args.spending,
                ));
              } else {
                throw Exception('Invalid arguments: $args');
              }
              break;
            case EditProfilePage.routeName:
              builder = (_) => EditProfilePage(userData: widget.userData);
              break;
            case ChangeUsernamePage.routeName:
              builder = (_) => ChangeUsernamePage(
                    userData: widget.userData,
                    onUsernameChange: onCancelRoute,
                  );
              break;
            case ChangePasswordPage.routeName:
              builder = (_) => ChangePasswordPage(userData: widget.userData);
              break;
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}
