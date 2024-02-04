import 'dart:io';

class ImageModel {
  late String name;
  final String path;
  final String dateHistory;
  late String extractedText;
  late String selectedLanguage = 'English';

  ImageModel({
    required this.path,
    required this.dateHistory,
  }) {
    name = path.split(Platform.pathSeparator).last;
  }
}
