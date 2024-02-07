import 'dart:io';
import 'package:hive/hive.dart';
import 'package:intl/intl.dart';
import 'package:snap_text/core/utils/languages_enum.dart';

part 'image_model.g.dart';

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

  ImageModel.copy(ImageModel imageModel)
      : name = imageModel.name,
        path = imageModel.path,
        dateHistory = imageModel.dateHistory,
        extractedText = imageModel.extractedText,
        selectedLanguage = imageModel.selectedLanguage;

  bool isExpired(int daysToExpire) {
    final now = DateTime.now();
    final date = _parseDate(dateHistory); // Convert the string to DateTime
    final difference = now.difference(date).inDays;
    return difference >= daysToExpire;
  }

  DateTime _parseDate(String dateString) {
    const pattern = 'hh:mm a dd/MM/yyyy'; // Define the format pattern
    final formatter = DateFormat(pattern); // Create a DateFormat object
    return formatter.parse(dateString); // Parse the string to DateTime
  }
}
