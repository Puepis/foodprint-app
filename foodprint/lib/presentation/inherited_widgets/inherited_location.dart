import 'package:flutter/material.dart';

class InheritedLocation extends InheritedWidget {
  final double latitude;
  final double longitude;
  const InheritedLocation({this.latitude, this.longitude, Widget child})
      : super(child: child);

  static InheritedLocation of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedLocation>();
  }

  @override
  bool updateShouldNotify(InheritedLocation oldWidget) => true;
}
