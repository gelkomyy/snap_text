import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snap_text/core/models/image_model.dart';

class HistoryItemPhoto extends StatelessWidget {
  const HistoryItemPhoto({
    super.key,
    required this.imageModel,
  });
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey, width: 0.7),
        image: DecorationImage(
          fit: BoxFit.fill,
          image: FileImage(
            File(imageModel.path),
          ),
        ),
        // color: kPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      //child: Image.file(File(imageModel.path)),
    );
  }
}
