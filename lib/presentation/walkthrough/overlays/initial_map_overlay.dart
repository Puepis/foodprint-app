import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';
import 'package:foodprint/presentation/walkthrough/overlays/generic.dart';
import 'package:provider/provider.dart';

import '../walkthrough_model.dart';

class MenuButtonOverlay extends StatelessWidget {
  const MenuButtonOverlay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walkthrough = context.watch<WalkthroughModel>();
    return GenericOverlay(
      index: 1,
      onTap: walkthrough.next,
      children: [
        Positioned(
            top: 100,
            left: 20,
            child: Image.asset("assets/images/walkthrough/tl_arrow.png")),
        Positioned(
            top: 122,
            left: 77,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Main Menu",
                  style: TextStyle(
                      color: primaryColorDark,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 4,
                ),
                const Text(
                  "Here you can access your\nprofile to view your foodprint\nstats!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
              ],
            )),
      ],
    );
  }
}

class MapDescriptionOverlay extends StatelessWidget {
  const MapDescriptionOverlay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walkthrough = context.watch<WalkthroughModel>();
    return GenericOverlay(
      index: 2,
      onTap: walkthrough.next,
      children: [
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.32,
          child: const Text(
            "This is your personal food map\nthat displays all of the places\nyou've visited.\n\nOnce you've taken a photo, a\nmarker will appear signifying a\nnew addition to your foodprint!",
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
        ),
      ],
    );
  }
}

class ToGalleryOverlay extends StatelessWidget {
  const ToGalleryOverlay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GenericOverlay(
      index: 3,
      onTap: () => null,
      children: [
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
                fontSize: 16,
                fontWeight: FontWeight.normal),
          ),
        )
      ],
    );
  }
}
