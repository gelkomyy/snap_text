import 'dart:io';

import 'package:flutter/material.dart';
import 'package:snap_text/core/models/image_model.dart';

class InTopExtractedTextDetails extends StatelessWidget {
  const InTopExtractedTextDetails({
    super.key,
    required this.imageModel,
  });
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Extracted Text',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              'Edit, Copy and Save the text',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ],
        ),
        Container(
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
        ),
      ],
    );
  }
}
