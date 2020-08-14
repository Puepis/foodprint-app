import 'package:flutter/material.dart';

import 'legal.dart';

class TermsOfService extends StatelessWidget {
  static const String routeName = "/tos";
  const TermsOfService({Key key}) : super(key: key);

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
      appBar: AppBar(
        title: const Text('Terms of Service'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: ListView(
          children: [
            RichText(
              text: TextSpan(
                  text: 'Terms of Service\n',
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
                      text: termsIntroText,
                      style: _bodyTextStyle,
                    ),
                    TextSpan(text: "Your Stuff\n", style: _headerTextStyle),
                    TextSpan(
                      text: termsContentText,
                      style: _bodyTextStyle,
                    ),
                    TextSpan(
                        text: "What You Can't Do\n", style: _headerTextStyle),
                    TextSpan(
                      text: prohibitedActionsText,
                      style: _bodyTextStyle,
                    ),
                    TextSpan(text: "Additional\n", style: _headerTextStyle),
                    TextSpan(
                      text: additionalText,
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


