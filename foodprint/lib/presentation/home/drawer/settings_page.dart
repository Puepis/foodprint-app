import 'package:flutter/material.dart';

class SettingsPage extends StatelessWidget {
  static const String routeName = "/settings";
  const SettingsPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text("Settings"),
      ),
    );
  }
}
