
import 'dart:io';
import 'package:path_provider/path_provider.dart';

// Contains methods for retrieving content and basic file methods
class FileManager {

  // Create new folder in AppDoc, returns the path
  Future<String> createFolder(String path, String folderName) async {
    final Directory _folder = Directory('$path/$folderName/');

    // If folder exists, return path
    if (await _folder.exists()) {
      return _folder.path;
    } else { // Create new folder, then return
      final Directory _newFolder = await _folder.create(recursive: true);
      return _newFolder.path;
    }
  }

  static Future<String> getAppDocDir() async {
    return (await getApplicationDocumentsDirectory()).path;
  }

  static List<FileSystemEntity> getAllFromPath(String path) {
    List<FileSystemEntity> res = [];
    try {
      res = Directory(path).listSync();
    }
    on FileSystemException {
      print("Directory not initialized.");
    }
    return res;
  }

  static File openFile(FileSystemEntity dir, String filename) {
    return File('${dir.path}/$filename');
  }
}