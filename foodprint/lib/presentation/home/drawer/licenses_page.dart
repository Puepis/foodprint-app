import 'package:flutter/material.dart';

class LicensesPage extends StatelessWidget {
  static const String routeName = "/licenses";
  const LicensesPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text("Licenses"),
      ),
    );
  }
}
