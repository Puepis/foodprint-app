import 'package:flutter/material.dart';

class PrivacyPolicy extends StatelessWidget {
  static const String routeName = "/privacy";
  const PrivacyPolicy({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Privacy Policy"
        ),
      ),
      body: const Padding(
        padding: EdgeInsets.all(20.0),
        child: Text("Privacy Policy"),
      ),
    );
  }
}