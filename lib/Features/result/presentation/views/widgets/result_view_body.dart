import 'package:flutter/material.dart';
import 'package:snap_text/Features/result/presentation/views/widgets/extracted_text_field.dart';
import 'package:snap_text/Features/result/presentation/views/widgets/in_top_extracted_text_details.dart';
import 'package:snap_text/Features/result/presentation/views/widgets/result_buttons.dart';
import 'package:snap_text/core/models/image_model.dart';

class ResultViewBody extends StatelessWidget {
  const ResultViewBody({
    super.key,
    required this.imageModel,
  });
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(14),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                InTopExtractedTextDetails(imageModel: imageModel),
                const SizedBox(
                  height: 10,
                ),
                ExtractedTextField(
                  imageModel: imageModel,
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          const ResultButtons(),
        ],
      ),
    );
  }
}
