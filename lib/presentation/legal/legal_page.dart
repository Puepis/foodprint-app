import 'package:flutter/material.dart';

import 'legal.dart';

class LegalPage extends StatelessWidget {
  static const String routeName = "/legal";
  const LegalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Legal"),
      ),
      body: ListView(
        padding: const EdgeInsets.all(5.0),
        children: [
          ListTile(
            title: const Text("Terms of Service"),
            onTap: () => Navigator.pushNamed(context, TermsOfService.routeName),
          ),
          ListTile(
            title: const Text("Privacy Policy"),
            onTap: () => Navigator.pushNamed(context, PrivacyPolicy.routeName),
          ),
          ListTile(
            title: const Text("Software Licenses"),
            onTap: () => showLicensePage(
              context: context,
              applicationVersion: '1.0.0',
            ),
          )
        ],
      ),
    );
  }
}
