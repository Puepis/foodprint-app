import 'package:flutter/material.dart';

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
      appBar: AppBar(
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

const privacyText =
    '''Foodprint is an open source application created by Philips Xu. This service is provided at no cost and is intended for use "as is". This page informs users about the collection, use, and sharing of personal and sensitive data.\n\n''';

const informationUseText =
    """For a better experience while using the application, we require certain sensitive and personally identifiable information. Your location will be used to provide the restaurant search feature and will be retained on your device only. The application also requires camera and gallery permissions to capture photos. The photos will only be stored by us and will only be used to improve the user experience. The disclosed information will not be collected by third party services. However, the app does use third party services to provide features for the application, namely the Google Play services and the Google Maps API. By using this application. you agree to Google's Privacy Policy.\n\n""";

const changesToPolicyText =
    """The Privacy Policy may be updated from time to time. If any changes are made, they will be reflected in the 'last updated' section at the top of the page.\n\n""";

const contactUsText =
    """If you have any questions or concerns about the Privacy Policy, please contact me at philips.xu1@gmail.com.""";
