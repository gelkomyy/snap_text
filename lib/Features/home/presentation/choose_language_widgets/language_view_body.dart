import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:snap_text/Features/home/presentation/choose_language_widgets/bottom_of_language_view.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({
    super.key,
    required this.croppedFile,
  });

  final CroppedFile croppedFile;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Flexible(
          child: Image.file(
            File(croppedFile.path),
          ),
        ),
        Container(
          color: const Color(0xffFAFBFD),
          child: const BottomOfLanguageView(),
        ),
      ],
    );
  }
}
