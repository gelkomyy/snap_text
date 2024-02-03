import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';

class ChooseLanguageView extends StatelessWidget {
  const ChooseLanguageView({super.key, required this.croppedFile});
  final CroppedFile croppedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFAFBFD),
        title: const Text(
          'Language',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(
          child: Column(
        children: [
          Flexible(
            child: Image.file(
              File(croppedFile.path),
            ),
          ),
          Container(
            color: const Color(0xffFAFBFD),
            child: Column(children: [
              InkWell(
                onTap: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return const LanguageDialog();
                      });
                },
                child: Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Colors.grey,
                    ),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                  ),
                  margin: const EdgeInsets.only(top: 20, left: 20, right: 20),
                  padding: const EdgeInsets.symmetric(horizontal: 12),
                  height: 55,
                  child: const Row(
                    children: [
                      Icon(
                        Icons.translate,
                        size: 30,
                      ),
                      SizedBox(
                        width: 12,
                      ),
                      Text(
                        'Choose a language',
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.w600),
                      ),
                      Spacer(),
                      Card(
                        color: Color(0xff3F54FF),
                        child: Padding(
                          padding: EdgeInsets.all(2),
                          child: Icon(
                            Icons.arrow_forward,
                            size: 14,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
                width: double.infinity,
                height: 46,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xff3F54FF),
                  ),
                  child: const Text(
                    'Extract Text',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
            ]),
          )
        ],
      )),
    );
  }
}

class LanguageDialog extends StatelessWidget {
  const LanguageDialog({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: AspectRatio(
        aspectRatio: 0.73,
        child: Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(14),
            color: Colors.white,
          ),

          // height:   MediaQuery.of(context).size.height * 0.5,
          child: Column(
            children: [
              Text(
                'Select Language',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 8,
              ),
              Divider(
                indent: 50,
                endIndent: 50,
              ),
              MyLanguages(),
              SizedBox(
                height: 18,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        height: 36,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            side: const BorderSide(
                              width: 0.6,
                              color: Colors.grey,
                            ),
                            elevation: 0,
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                            ),
                          ),
                          child: const Text(
                            'Cancel',
                            style: TextStyle(
                              color: Colors.black87,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 16,
                    ),
                    Flexible(
                      child: SizedBox(
                        width: double.infinity,
                        height: 36,
                        child: ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xff3F54FF),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              )),
                          child: const Text(
                            'Done',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    super.key,
    required this.language,
    required this.selectedLanguage,
  });
  final String language;
  final String selectedLanguage;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.6,
          color: Colors.grey,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(top: 8),
      height: 38,
      child: Row(
        children: [
          selectedLanguage == language
              ? const Icon(
                  Icons.radio_button_checked,
                  color: Color(0xff3F54FF),
                  size: 21,
                )
              : const Icon(
                  Icons.radio_button_unchecked,
                  color: Colors.grey,
                  size: 21,
                ),
          const SizedBox(
            width: 10,
          ),
          Text(
            language,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}

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
