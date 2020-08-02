import 'dart:io';

import 'package:flutter/material.dart';

class InheritedImage extends InheritedWidget {
  final File imageFile;
  final FileImage loadedImage;
  const InheritedImage({this.imageFile, this.loadedImage, Widget child})
      : super(child: child);

  static InheritedImage of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedImage>();
  }

  @override
  bool updateShouldNotify(InheritedImage oldWidget) => true;
}
