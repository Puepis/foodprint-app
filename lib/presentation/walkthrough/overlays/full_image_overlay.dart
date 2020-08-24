import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../walkthrough_model.dart';

class FullImageOverlay extends StatelessWidget {
  const FullImageOverlay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walkthrough = context.watch<WalkthroughModel>();
    return Visibility(
      visible: walkthrough.screen == 6,
      child: Opacity(
        opacity: 0.85,
        child: Material(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFF454545),
            child: Stack(
              children: [
                Positioned(
                  bottom: 150,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Image.asset("assets/images/walkthrough/up_arrow.png"),
                          const SizedBox(
                            width: 10,
                          ),
                          const Text("Swipe up to view the details!",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: 14)),
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Row(
                        children: const [
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                              "Once you’re done, head to the map\nto check out your updated\nfoodprint!",
                              style: TextStyle(
                                  fontWeight: FontWeight.normal,
                                  color: Colors.white,
                                  fontSize: 14)),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
