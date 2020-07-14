import 'package:flutter/material.dart';
import 'package:foodprint/domain/auth/jwt_model.dart';
import 'package:foodprint/domain/foodprint/foodprint_entity.dart';

class InheritedUser extends InheritedWidget {
  final FoodprintEntity foodprint;
  final JWT token;
  const InheritedUser({this.token, this.foodprint, Widget child}) : super(child: child);

  static InheritedUser of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedUser>();
  }

  @override
  bool updateShouldNotify(InheritedUser oldWidget) => true;
}
