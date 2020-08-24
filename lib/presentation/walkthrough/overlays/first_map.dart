import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:provider/provider.dart';

import '../walkthrough_model.dart';

class FirstMapOverlay extends StatelessWidget {
  const FirstMapOverlay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walkthrough = context.watch<WalkthroughModel>();
    return Visibility(
      visible: walkthrough.screen == 1,
      child: Opacity(
        opacity: 0.85,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          color: const Color(0xFF454545),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Stack(
              children: [
                Positioned(
                    top: 100,
                    left: 20,
                    child:
                        Image.asset("assets/images/walkthrough/tl_arrow.png")),
                Positioned(
                    top: 127,
                    left: 77,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Main Menu",
                          style: TextStyle(
                              color: primaryColorDark,
                              fontSize: 14,
                              fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(
                          height: 2.5,
                        ),
                        const Text(
                          "Here you can access your\nprofile to view your\nfoodprint stats!",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                              fontWeight: FontWeight.normal),
                        ),
                      ],
                    )),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.32,
                  child: const Text(
                    "This is your personal food map\nthat displays all of the places\nyou've visited.\n\nOnce you've taken a photo, a\nmarker will appear signifying a\nnew addition to your foodprint!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Positioned(
                  right: MediaQuery.of(context).size.width * 0.15,
                  bottom: 15,
                  child: Image.asset("assets/images/walkthrough/br_arrow.png"),
                ),
                Positioned(
                  bottom: 80,
                  right: MediaQuery.of(context).size.width * 0.10,
                  child: const Text(
                    "Next, head to your gallery!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
