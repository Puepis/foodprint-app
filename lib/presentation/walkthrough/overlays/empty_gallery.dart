import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../walkthrough_model.dart';

class EmptyGalleryOverlay extends StatelessWidget {
  const EmptyGalleryOverlay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walkthrough = context.watch<WalkthroughModel>();
    return Visibility(
      visible: walkthrough.screen == 2,
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
                  top: 10,
                  right: 0,
                  child: Image.asset("assets/images/walkthrough/tr_arrow.png"),
                ),
                const Positioned(
                  top: 28,
                  right: 52,
                  child: Text(
                    "Use this to sort\nyour photos!",
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                ),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.32,
                  child: const Text(
                    "This is your gallery where all of\nyour photos will be displayed.\n\nCurrently, you don't have any\nphotos. Let's add one to your\ncollection!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
                  ),
                ),
                Positioned(
                  left: MediaQuery.of(context).size.width * 0.23,
                  bottom: 15,
                  child: Image.asset("assets/images/walkthrough/fab_arrow.png"),
                ),
                const Positioned(
                  left: 10,
                  bottom: 65,
                  child: Text(
                    "Click here to take a new photo!",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal),
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
