import 'package:hive/hive.dart';

part 'languages_enum.g.dart';

@HiveType(typeId: 1)
enum LanguagesEnum {
  @HiveField(0)
  english,
  @HiveField(1)
  arabic,
  @HiveField(2)
  spanish,
  @HiveField(3)
  french,
  @HiveField(4)
  german,
  @HiveField(5)
  turkish,
  @HiveField(6)
  russian,

  // Add more languages as needed
}

extension LanguageExtension on LanguagesEnum {
  String get shortCode {
    switch (this) {
      case LanguagesEnum.english:
        return 'eng';
      case LanguagesEnum.arabic:
        return 'ara';
      case LanguagesEnum.spanish:
        return 'spa';
      case LanguagesEnum.french:
        return 'fre';
      case LanguagesEnum.german:
        return 'ger';
      case LanguagesEnum.turkish:
        return 'tur';
      case LanguagesEnum.russian:
        return 'rus';
      default:
        return '';
    }
  }

  String get displayName {
    // Convert enum value to lowercase and capitalize the first character
    String enumString = toString().split('.').last;
    return enumString[0].toUpperCase() + enumString.substring(1);
  }
}

/* LanguagesEnum getLanguageFromDisplayName(String displayName) {
  for (var lang in LanguagesEnum.values) {
    if (lang.displayName == displayName) {
      return lang;
    }
  }
  return LanguagesEnum.english;
} */
