import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:snap_text/Features/choose_language/presentation/views/widgets/choose_language_box.dart';
import 'package:snap_text/Features/choose_language/presentation/views/widgets/language_dialog.dart';
import 'package:snap_text/Features/result/presentation/views/result_view.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/get_extracted_text.dart';
import 'package:snap_text/core/utils/languages_enum.dart';

class BottomOfLanguageView extends StatelessWidget {
  const BottomOfLanguageView({
    super.key,
    required this.imageModel,
  });
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (context) {
                return LanguageDialog(
                  imageModel: imageModel,
                );
              });
        },
        child: const ChooseLanguageBox(),
      ),
      const SizedBox(
        height: 16,
      ),
      Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
        width: double.infinity,
        height: 46,
        child: ElevatedButton(
          onPressed: () async {
            String extractedText = await GetExtractedText().getTextFromApi(
                file: File(imageModel.path),
                language: imageModel.selectedLanguage);
            imageModel.extractedText = extractedText;
            Navigator.of(context)
                .pushReplacement(MaterialPageRoute(builder: (context) {
              return ResultView(imageModel: imageModel);
            }));
          },
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
    ]);
  }
}
