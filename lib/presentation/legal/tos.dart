import 'package:flutter/material.dart';

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
                      text: introText,
                      style: _bodyTextStyle,
                    ),
                    TextSpan(text: "Your Stuff\n", style: _headerTextStyle),
                    TextSpan(
                      text: contentText,
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

const introText = """
Welcome to Foodprint!\n\nPlease note that many functions of the application require an active internet connection, either through Wi-Fi or provided by your mobile network provider.\n\nThese Terms of Service govern your use of Foodprint and inform you about the Foodprint application. By creating a Foodprint account and using the application, you agree to these terms.\n\n""";

const contentText =
    """The photos that you take belong entirely to you. These Terms of Service don’t allow us to use your content except for the purposes of improving the application. However, we have the right to review and delete content that violates the law. Otherwise, we have no obligation to review your photos.\n\n""";

const prohibitedActionsText =
    """You can’t take any photos that showcase illegal content or violate these Terms of Service. If you do, we have the right to remove the content or delete your Foodprint account.\n\n""";

const additionalText =
    """This application uses the Places API as part of the application, thus by using the application you are complying with Google’s Terms of Service. If you have any questions or additional feedback, please do not hesitate to contact me at philips.xu1@gmail.com.""";
