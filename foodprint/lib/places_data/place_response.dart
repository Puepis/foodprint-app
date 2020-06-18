import 'result.dart';

class PlaceResponse {
  final List<String> htmlAttributions;
  final List<Result> results;
  final String status;
  final String nextPageToken;

  PlaceResponse({this.htmlAttributions, this.results, this.status, this.nextPageToken});

  PlaceResponse fromJson(Map<String, dynamic> json) {
    return PlaceResponse(
        htmlAttributions: List<String>.from(json['html_attributions'] as List<dynamic>),
        nextPageToken: json['next_page_token'] as String,
        results: parseResults(json['results'] as List<dynamic>),
        status: json['status'] as String);
  }

  static List<Result> parseResults(List<dynamic> list){
    return list.map((i) => Result.fromJson(i as Map<String, dynamic>)).toList();
  }
}