import 'dart:io';
import 'package:snap_text/core/utils/languages_enum.dart';

class ImageModel {
  late String name;
  final String path;
  final String dateHistory;
  late String extractedText;
  late LanguagesEnum selectedLanguage = LanguagesEnum.english;

  ImageModel({
    required this.path,
    required this.dateHistory,
  }) {
    name = path.split(Platform.pathSeparator).last;
  }
}
