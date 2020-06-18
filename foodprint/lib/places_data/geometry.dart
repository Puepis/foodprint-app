import 'location.dart';
import 'viewport.dart';

class Geometry {
  final Location location;
  final ViewPort viewPort;
  Geometry({this.location, this.viewPort});

  factory Geometry.fromJson(Map<String, dynamic> json){
    return Geometry(
        location: Location.fromJson(json['location'] as Map<String, dynamic>),
        viewPort: ViewPort.fromJson(json['viewport'] as Map<String, dynamic>)
    );
  }
}