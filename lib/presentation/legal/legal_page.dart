import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/gradients.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import 'legal.dart';

class LegalPage extends StatelessWidget {
  static const String routeName = "/legal";
  const LegalPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(
          colors: sweetMorningGradient
        ),
        centerTitle: true,
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
              applicationVersion: '2.0.1',
            ),
          )
        ],
      ),
    );
  }
}
