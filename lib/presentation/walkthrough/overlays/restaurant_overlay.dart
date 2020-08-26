import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../walkthrough_model.dart';

class RestaurantOverlay extends StatefulWidget {
  const RestaurantOverlay({
    Key key,
  }) : super(key: key);

  @override
  _RestaurantOverlayState createState() => _RestaurantOverlayState();
}

class _RestaurantOverlayState extends State<RestaurantOverlay> {
  bool _dismissed = false;

  @override
  Widget build(BuildContext context) {
    final walkthrough = context.watch<WalkthroughModel>();
    return Visibility(
      visible: walkthrough.screen == 6 && !_dismissed,
      child: Opacity(
        opacity: 0.88,
        child: Material(
          child: GestureDetector(
            onTap: () => setState(() => _dismissed = true),
            child: Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              color: const Color(0xFF454545),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Stack(
                  children: [
                    Positioned(
                        top: kToolbarHeight + 5,
                        right: 15,
                        child: Image.asset(
                            "assets/images/walkthrough/search_arrow.png")),
                    const Positioned(
                      top: kToolbarHeight - 10,
                      right: 50,
                      child: Text(
                          "If your location isn't listed,\ntry a manual search!",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    ),
                    const Positioned(
                      bottom: 50,
                      child: Text(
                          "Tap anywhere and select a location\nto move on to the final step!",
                          style: TextStyle(color: Colors.white, fontSize: 16)),
                    )
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
