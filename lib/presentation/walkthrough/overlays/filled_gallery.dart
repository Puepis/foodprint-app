import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../walkthrough_model.dart';

class FilledGalleryOverlay extends StatelessWidget {
  const FilledGalleryOverlay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walkthrough = context.watch<WalkthroughModel>();
    return Visibility(
      visible: walkthrough.screen == 5,
      child: Opacity(
        opacity: 0.85,
        child: Material(
          child: GestureDetector(
            onTap: walkthrough.next,
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color(0xFF454545),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Stack(
                  children: [
                    Positioned(
                      top: MediaQuery.of(context).size.width * 0.5 + 20,
                      left: MediaQuery.of(context).size.width * 0.10,
                      child:
                          Image.asset("assets/images/walkthrough/tl_arrow.png"),
                    ),
                    Positioned(
                      top: MediaQuery.of(context).size.width * 0.5 + 44,
                      left: MediaQuery.of(context).size.width * 0.25,
                      child: const Text(
                          "Now you have a photo in your\ncollection! Tap on it to get a\nbetter look!",
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
      ),
    );
  }
}
