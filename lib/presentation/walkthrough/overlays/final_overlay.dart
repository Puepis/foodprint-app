import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../walkthrough_model.dart';

class FinalOverlay extends StatelessWidget {
  const FinalOverlay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walkthrough = context.watch<WalkthroughModel>();
    return Visibility(
      visible: walkthrough.screen == 7,
      child: Opacity(
        opacity: 0.85,
        child: GestureDetector(
          onTap: walkthrough.finish,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFF454545),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Stack(
                children: [
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.32,
                    child: const Text(finalText,
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                            fontSize: 14)),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

const finalText =
    "Tap on markers to view your photos\nat a particular location.\n\nThere's more to explore in\nFoodprint, so have some fun\nlooking around!\n\nThanks for following this walkthrough!";
