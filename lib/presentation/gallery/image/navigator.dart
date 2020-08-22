import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/gallery/edit/edit.dart';

import 'full_image.dart';

class FullImageNavigator extends StatefulWidget {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey();
  FullImageNavigator({Key key}) : super(key: key);

  @override
  _FullImageNavigatorState createState() => _FullImageNavigatorState();
}

class _FullImageNavigatorState extends State<FullImageNavigator> {
  Future<bool> didPopRoute() async {
    final NavigatorState navigator = widget.navigatorKey.currentState;
    assert(navigator != null);
    return navigator.maybePop();
  }

  void onCancelRoute() => Navigator.pop(context);

  @override
  Widget build(BuildContext context) {
    // A nested navigator representing the "edit image" journey.
    return WillPopScope(
      onWillPop: () async {
        return !await didPopRoute();
      },
      child: Navigator(
        key: widget.navigatorKey,
        initialRoute: FullImage.routeName,
        onGenerateRoute: (settings) {
          WidgetBuilder builder;
          switch (settings.name) {
            case FullImage.routeName:
              builder = (_) => const FullImage();
              break;
            case EditImagePage.routeName:
              return SlideUpEnterRoute(newPage: const EditImagePage());
            default:
              throw Exception('Invalid route: ${settings.name}');
          }
          return MaterialPageRoute(builder: builder, settings: settings);
        },
      ),
    );
  }
}
