import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../walkthrough_model.dart';

class GenericOverlay extends StatelessWidget {
  final int index;
  final List<Widget> children;
  final VoidCallback onTap;
  const GenericOverlay({
    Key key,
    @required this.index,
    @required this.children,
    @required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final walkthrough = context.watch<WalkthroughModel>();
    return Visibility(
      visible: walkthrough.enabled && walkthrough.screen == index,
      child: Opacity(
        opacity: 0.88,
        child: GestureDetector(
          onTap: onTap,
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: const Color(0xFF454545),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Stack(
                children: children,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
