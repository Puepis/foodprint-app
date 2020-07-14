import 'package:flutter/material.dart';
import 'package:foodprint/application/restaurants/restaurant_search_bloc.dart';

class InheritedSearchBloc extends InheritedWidget {
  final RestaurantSearchBloc bloc;
  const InheritedSearchBloc({this.bloc, Widget child}) : super(child: child);

  static InheritedSearchBloc of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<InheritedSearchBloc>();
  }

  @override
  bool updateShouldNotify(InheritedSearchBloc oldWidget) => true;
}
