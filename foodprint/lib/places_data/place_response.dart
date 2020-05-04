import 'result.dart';

class PlaceResponse {
  final List<String> htmlAttributions;
  final List<Result> results;
  final String status;
  final String nextPageToken;

  PlaceResponse({this.htmlAttributions, this.results, this.status, this.nextPageToken});

  PlaceResponse fromJson(Map<String, dynamic> json) {
    return PlaceResponse(
        htmlAttributions: List<String>.from(json['html_attributions']),
        nextPageToken: json['next_page_token'],
        results: parseResults(json['results']),
        status: json['status']);
  }

  static List<Result> parseResults(List<dynamic> list){
    return list.map((i) => Result.fromJson(i)).toList();
  }
}