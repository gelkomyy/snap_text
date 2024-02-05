import 'dart:io';
import 'package:hive/hive.dart';
import 'package:snap_text/core/utils/languages_enum.dart';

@HiveType(typeId: 0)
class ImageModel extends HiveObject {
  @HiveField(0)
  late String name;
  @HiveField(1)
  final String path;
  @HiveField(2)
  final String dateHistory;
  @HiveField(3)
  late String extractedText;
  @HiveField(4)
  late LanguagesEnum selectedLanguage = LanguagesEnum.english;

  ImageModel({
    required this.path,
    required this.dateHistory,
  }) {
    name = path.split(Platform.pathSeparator).last;
  }
}
