class Error {
  final String errorMessage;
  final List<dynamic> htmlAttributions;
  final List<dynamic> results;
  final String status;

  String getErrorMessage() {
    return errorMessage;
  }

  Error({this.errorMessage, this.htmlAttributions, this.results, this.status});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(
      errorMessage: json['error_message'] as String,
      htmlAttributions: json['html_attributions'] as List<dynamic>,
      results: json['results'] as List<dynamic>,
      status: json['status'] as String,
    );
  }
}