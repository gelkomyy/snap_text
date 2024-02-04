import 'package:flutter/material.dart';
import 'package:snap_text/Features/choose_language/presentation/views/widgets/language_item.dart';

class MyLanguages extends StatefulWidget {
  const MyLanguages({super.key});

  @override
  State<MyLanguages> createState() => _MyLanguagesState();
}

class _MyLanguagesState extends State<MyLanguages> {
  String selectedLanguage = 's';

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              selectedLanguage = 'English';
            });
          },
          child: LanguageItem(
            selectedLanguage: selectedLanguage,
            language: 'English',
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selectedLanguage = 'Arabic';
            });
          },
          child: LanguageItem(
            selectedLanguage: selectedLanguage,
            language: 'Arabic',
          ),
        ),
        LanguageItem(
          selectedLanguage: selectedLanguage,
          language: 'Chiness',
        ),
        LanguageItem(
          selectedLanguage: selectedLanguage,
          language: 'Japaness',
        ),
        LanguageItem(
          selectedLanguage: selectedLanguage,
          language: 'Turkish',
        ),
        LanguageItem(
          selectedLanguage: selectedLanguage,
          language: 'Turkish',
        ),
      ],
    );
  }
}
