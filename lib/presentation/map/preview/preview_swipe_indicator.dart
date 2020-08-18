import 'package:flutter/material.dart';
import 'package:foodprint/presentation/core/styles/colors.dart';

class PreviewSwipeIndicator extends StatelessWidget {
  const PreviewSwipeIndicator({
    Key key,
    @required this.constraints,
  }) : super(key: key);

  final BoxConstraints constraints;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: foodprintPrimaryColorSwatch[50],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0))),
      child: Center(
        child: SizedBox(
          width: constraints.maxWidth * 0.08,
          child: const Divider(
            color: Colors.black87,
            thickness: 3,
            height: 20,
          ),
        ),
      ),
    );
  }
}
