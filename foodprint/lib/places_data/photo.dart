class Photo {
  int height;
  int width;
  List<String> htmlAttributions;
  String photoReference;

  Photo({this.height, this.width, this.htmlAttributions, this.photoReference});

  factory Photo.fromJson(Map<String, dynamic> json){
    return Photo(
        height: json['height'] as int,
        width: json['width'] as int,
        htmlAttributions: List<String>.from(json['html_attributions'] as List<dynamic>),
        photoReference: json['photo_reference'] as String
    );
  }
}