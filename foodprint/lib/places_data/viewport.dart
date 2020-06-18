import 'location.dart';

class ViewPort {
  final Location northEast;
  final Location southWest;
  ViewPort({this.northEast, this.southWest});

  factory ViewPort.fromJson(Map<String, dynamic> json){
    return ViewPort(
        northEast: Location.fromJson(json['northeast'] as Map<String, dynamic>),
        southWest: Location.fromJson(json['southwest'] as Map<String, dynamic>)
    );
  }
}