import 'dart:io';

import 'package:flutter/material.dart';

class FullImage extends StatelessWidget {
  final File imageFile;
  FullImage({Key key, @required this.imageFile}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Container(
        child: Center(
          child: Image.file(imageFile),
        ),
      )
    );
  }
}
