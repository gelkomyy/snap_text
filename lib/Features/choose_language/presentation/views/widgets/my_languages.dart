import 'package:flutter/material.dart';
import 'package:snap_text/Features/choose_language/presentation/views/widgets/language_item.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/languages_enum.dart';

class MyLanguages extends StatefulWidget {
  const MyLanguages({super.key, required this.imageModel});
  final ImageModel imageModel;
  @override
  State<MyLanguages> createState() => _MyLanguagesState();
}

class _MyLanguagesState extends State<MyLanguages> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
          itemCount: LanguagesEnum.values.length,
          itemBuilder: (context, index) {
            return InkWell(
              onTap: () {
                setState(() {
                  widget.imageModel.selectedLanguage =
                      LanguagesEnum.values[index];
                });
              },
              child: LanguageItem(
                language: LanguagesEnum.values[index].displayName,
                selectedLanguage:
                    widget.imageModel.selectedLanguage.displayName,
              ),
            );
          }),
    );

    /* return Column(
      children: [
        InkWell(
          onTap: () {
            setState(() {
              widget.imageModel.selectedLanguage = 'English';
            });
          },
          child: LanguageItem(
            selectedLanguage: widget.imageModel.selectedLanguage,
            language: 'English',
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              widget.imageModel.selectedLanguage = 'Arabic';
            });
          },
          child: LanguageItem(
            selectedLanguage: widget.imageModel.selectedLanguage,
            language: 'Arabic',
          ),
        ),
        LanguageItem(
          selectedLanguage: widget.imageModel.selectedLanguage,
          language: 'Chiness',
        ),
        LanguageItem(
          selectedLanguage: widget.imageModel.selectedLanguage,
          language: 'Japaness',
        ),
        LanguageItem(
          selectedLanguage: widget.imageModel.selectedLanguage,
          language: 'Turkish',
        ),
        LanguageItem(
          selectedLanguage: widget.imageModel.selectedLanguage,
          language: 'Turkish',
        ),
      ],
    ); */
  }
}
