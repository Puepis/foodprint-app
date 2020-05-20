
import 'dart:convert';
import 'dart:io';

import 'package:foodprint/models/photo_detail.dart';

class PhotoManager {

  static File openImgFile(FileSystemEntity dir) {
    return File('${dir.path}/img.jpg');
  }

  static File openContentFile(FileSystemEntity dir) {
    return File('${dir.path}/contents.json');
  }

  // Fetch photo details
  static PhotoDetail getContents(File file) {
    Map<String, dynamic> photoDetail = jsonDecode(file.readAsStringSync()); // decode JSON string
    return PhotoDetail.fromJson(photoDetail);
  }

}