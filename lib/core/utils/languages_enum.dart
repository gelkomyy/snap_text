enum LanguagesEnum {
  english,
  arabic,
  spanish,
  french,
  german,
  turkish,
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
    String enumString = this.toString().split('.').last;
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
