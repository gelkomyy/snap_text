import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snap_text/Features/choose_language/presentation/views/widgets/bottom_of_language_view.dart';
import 'package:snap_text/core/models/image_model.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({
    super.key,
    required this.imageModel,
  });

  final ImageModel imageModel;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: Align(
            alignment: Alignment.center,
            child: Image.file(
              File(imageModel.path),
            ),
          ),
        ),
        Container(
          color: const Color(0xffFAFBFD),
          child: BottomOfLanguageView(
            imageModel: imageModel,
          ),
        ),
      ],
    );
  }
}
