import 'package:flutter/material.dart';

class Indicator extends StatelessWidget {
  final Color color;
  final String text;
  final bool isSquare;
  final double size;

  const Indicator({
    Key key,
    this.color,
    this.text,
    this.isSquare,
    this.size = 12,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Container(
          width: size,
          height: size,
          decoration: BoxDecoration(
            shape: isSquare ? BoxShape.rectangle : BoxShape.circle,
            color: color,
          ),
        ),
        const SizedBox(
          width: 8,
        ),
        Expanded(
          child: Text(
            text,
            style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.normal,
                color: Colors.grey.shade600),
          ),
        )
      ],
    );
  }
}
