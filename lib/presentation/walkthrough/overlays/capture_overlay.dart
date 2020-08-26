import 'package:flutter/material.dart';

class CaptureOverlay extends StatelessWidget {
  const CaptureOverlay({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Opacity(
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
                right: 70,
                bottom: 60,
                child: Image.asset("assets/images/walkthrough/fab_arrow.png"),
              ),
              const Positioned(
                right: 20,
                bottom: 110,
                child: Text(
                  "Great photo - let's select your location!",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.normal),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
