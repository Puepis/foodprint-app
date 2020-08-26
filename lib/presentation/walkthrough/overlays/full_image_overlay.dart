import 'package:flutter/material.dart';
import 'package:foodprint/presentation/walkthrough/overlays/generic.dart';

class FullImageOverlay extends StatelessWidget {
  const FullImageOverlay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GenericOverlay(
      index: 8,
      onTap: () => null,
      children: [
        Positioned(
          bottom: height * 0.3,
          child: Row(
            children: [
              Image.asset("assets/images/walkthrough/up_arrow.png"),
              const SizedBox(
                width: 10,
              ),
              const Text("Swipe up to view the details!",
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                      fontSize: 16)),
            ],
          ),
        ),
        Positioned(
          bottom: height * 0.20,
          child: const Text(
              "Once you’re done, head back to the\noriginal map screen to check out your\nupdated foodprint!",
              style: TextStyle(
                  fontWeight: FontWeight.normal,
                  color: Colors.white,
                  fontSize: 16)),
        )
      ],
    );
  }
}
