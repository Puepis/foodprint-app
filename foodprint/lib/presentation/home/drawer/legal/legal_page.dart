import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/animations/transitions.dart';
import 'package:foodprint/presentation/home/drawer/legal/privacy_policy.dart';
import 'package:foodprint/presentation/home/drawer/legal/tos.dart';

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
            title: const Text("Terms & Conditions"),
            onTap: () => Navigator.push(context, SlideUpEnterRoute(newPage: const TermsOfService())),
          ),
          ListTile(
            title: const Text("Privacy Policy"),
            onTap: () => Navigator.push(context, SlideUpEnterRoute(newPage: const PrivacyPolicy()),)
          ),
          ListTile(
            title: const Text("Software Licenses"),
            onTap: () => showLicensePage(
              context: context,
              applicationVersion: '1.0.0',
              applicationLegalese:
                  "Legal information", // TODO: Add legal information
            ),
          )
        ],
      ),
    );
  }
}
