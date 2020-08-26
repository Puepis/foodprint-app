import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/gradients.dart';
import 'package:gradient_app_bar/gradient_app_bar.dart';

import 'legal.dart';

class PrivacyPolicy extends StatelessWidget {
  static const String routeName = "/privacy";
  const PrivacyPolicy({Key key}) : super(key: key);

  TextStyle get _headerTextStyle =>
      _bodyTextStyle.copyWith(fontSize: 18.0, fontWeight: FontWeight.bold);

  TextStyle get _bodyTextStyle => const TextStyle(
      height: 1.3,
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.normal);

  TextStyle get _lastUpdatedTextStyle => const TextStyle(
      height: 3,
      color: Colors.black,
      fontSize: 16.0,
      fontWeight: FontWeight.normal);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GradientAppBar(
        gradient: LinearGradient(colors: sweetMorningGradient),
        centerTitle: true,
        title: const Text("Privacy Policy"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            RichText(
              text: TextSpan(
                  text: 'Privacy Policy\n',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 24,
                    color: Colors.black,
                  ),
                  children: [
                    TextSpan(
                        text: 'Last updated: August 5, 2020\n\n',
                        style: _lastUpdatedTextStyle),
                    TextSpan(
                      text: privacyText,
                      style: _bodyTextStyle,
                    ),
                    TextSpan(
                        text: "Information Collection and Use\n",
                        style: _headerTextStyle),
                    TextSpan(
                      text: informationUseText,
                      style: _bodyTextStyle,
                    ),
                    TextSpan(
                        text: "Changes to the Privacy Policy\n",
                        style: _headerTextStyle),
                    TextSpan(
                      text: changesToPolicyText,
                      style: _bodyTextStyle,
                    ),
                    TextSpan(text: "Contact Us\n", style: _headerTextStyle),
                    TextSpan(
                      text: contactUsText,
                      style: _bodyTextStyle,
                    ),
                  ]),
            ),
          ],
        ),
      ),
    );
  }
}
