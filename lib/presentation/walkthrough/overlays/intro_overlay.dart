import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../walkthrough_model.dart';

class IntroOverlay extends StatelessWidget {
  const IntroOverlay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walkthrough = context.watch<WalkthroughModel>();
    return Visibility(
      visible: walkthrough.enabled && walkthrough.screen == 0,
      child: Opacity(
        opacity: 0.92,
        child: Material(
          child: GestureDetector(
            onTap: walkthrough.next,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color(0xFF454545),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text("Welcome to Foodprint!",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 28)),
                    SizedBox(
                      height: 18,
                    ),
                    Text(text1,
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            color: Colors.white,
                            fontSize: 16)),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const text1 =
    "Foodprint is your personal food journal that\nenables you to record all of your dining experiences around the world!\n\nThis tutorial will guide you through the main features of the app.\n\nTap anywhere to get started!";
