import 'package:flutter/material.dart';
import 'package:foodprint/presentation/walkthrough/walkthrough.dart';
import 'package:provider/provider.dart';

import '../walkthrough_model.dart';

class FinalOverlay extends StatelessWidget {
  final String username;
  const FinalOverlay({
    Key key,
    @required this.username,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walkthrough = context.watch<WalkthroughModel>();
    return GenericOverlay(
      index: 9,
      onTap: () async {
        walkthrough.finish(username);
      },
      children: [
        Positioned(
          bottom: MediaQuery.of(context).size.height * 0.32,
          child: const Text(finalText,
              style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  fontSize: 16)),
        ),
      ],
    );
  }
}

const finalText =
    "Tap on markers to view your photos\nat a particular location.\n\nThere's more to explore in\nFoodprint, so have some fun\nlooking around!\n\nThanks for following this walkthrough!";
