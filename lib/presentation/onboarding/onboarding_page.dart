import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/gallery/gallery.dart';
import 'package:foodprint/presentation/register_page/register_page.dart';
import 'package:google_fonts/google_fonts.dart';

import 'page_content.dart';

/// Introduces the foodprint app to new users.
class OnboardingScreen extends StatefulWidget {
  static const routeName = "/onboarding";
  const OnboardingScreen({Key key}) : super(key: key);

  @override
  _OnboardingScreenState createState() => _OnboardingScreenState();
}

class _OnboardingScreenState extends State<OnboardingScreen> {
  final int _pages = 3;
  int _currentPage = 0;

  List<Map<String, String>> onboardingData = [
    {
      "text": "Your personal food journal.",
      "image": "assets/images/onboarding/map.png"
    },
    {
      "text": "Record your dining experiences!",
      "image": "assets/images/onboarding/dish.png"
    },
    {
      "text": "Track your spending!",
      "image": "assets/images/onboarding/money.png"
    },
  ];

  List<Widget> _buildPageIndicator() {
    return List.generate(_pages, (index) => _buildIndicator(index));
  }

  Widget _buildIndicator(int index) {
    final isActive = index == _currentPage;
    return AnimatedContainer(
      duration: const Duration(milliseconds: 150),
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      height: 8.0,
      width: isActive ? 22.0 : 14.0,
      decoration: BoxDecoration(
        color: isActive ? primaryColorDark : const Color(0xFFE5E5E5),
        borderRadius: const BorderRadius.all(Radius.circular(12)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: media.height * 0.15),
        child: Column(
          children: [
            Text(
              "Foodprint",
              style: GoogleFonts.rubik(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: primaryColorDark,
              ),
            ),
            Expanded(
                flex: 3,
                child: ScrollConfiguration(
                  behavior: NoGlowBehavior(),
                  child: PageView.builder(
                    itemCount: _pages,
                    onPageChanged: (page) =>
                        setState(() => _currentPage = page),
                    itemBuilder: (context, index) => PageContent(
                      image: onboardingData[index]["image"],
                      text: onboardingData[index]['text'],
                    ),
                  ),
                )),
            Expanded(
              flex: 2,
              child: Column(
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: _buildPageIndicator()),
                  const Spacer(),
                  ButtonTheme(
                    minWidth: media.width * 0.75,
                    child: RaisedButton(
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12)),
                      color: primaryColorDark,
                      onPressed: () => Navigator.pushReplacementNamed(
                          context, RegisterPage.fromOnboarding),
                      child: const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Text(
                          "Continue",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
