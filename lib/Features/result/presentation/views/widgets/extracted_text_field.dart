import 'package:flutter/material.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/languages_enum.dart';

class ExtractedTextField extends StatelessWidget {
  final ImageModel imageModel;
  const ExtractedTextField({
    super.key,
    required this.imageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: imageModel.extractedText,
          textDirection: imageModel.selectedLanguage == LanguagesEnum.arabic
              ? TextDirection.rtl
              : TextDirection.ltr,
          onChanged: (value) {
            imageModel.extractedText = value;
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                )),
            filled: true,
            fillColor: const Color(0xffF5F5F5),
            hintText: 'Extracted Text Here',
          ),
          maxLines: 16,
        ),
        const Text(
          'scroll the text if large',
          style: TextStyle(fontSize: 10),
        )
      ],
    );
  }
}
