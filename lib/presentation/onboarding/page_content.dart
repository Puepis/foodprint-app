import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PageContent extends StatelessWidget {
  final String text, image;
  const PageContent({Key key, @required this.text, @required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 32),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: GoogleFonts.rubik(
                color: const Color(0xFFB9B4B4),
                fontWeight: FontWeight.bold,
                fontSize: 18),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            child: Column(
              children: [
                Image.asset(
                  image,
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
