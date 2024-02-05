import 'package:flutter/material.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/languages_enum.dart';

class ChooseLanguageBoxItems extends StatelessWidget {
  const ChooseLanguageBoxItems({
    super.key,
    required this.imageModel,
  });
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Icon(
          Icons.translate,
          size: 30,
        ),
        const SizedBox(
          width: 12,
        ),
        Text(
          imageModel.selectedLanguage.displayName /* 'Choose a language' */,
          style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        const Spacer(),
        const Card(
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
    );
  }
}
