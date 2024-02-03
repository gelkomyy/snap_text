import 'package:flutter/material.dart';
import 'package:snap_text/Features/home/presentation/result_widgets/extracted_text_field.dart';
import 'package:snap_text/Features/home/presentation/result_widgets/in_top_extracted_text_details.dart';
import 'package:snap_text/Features/home/presentation/result_widgets/result_buttons.dart';

class ResultViewBody extends StatelessWidget {
  const ResultViewBody({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Colors.grey),
            borderRadius: BorderRadius.circular(14),
          ),
          child: const Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              InTopExtractedTextDetails(),
              SizedBox(
                height: 10,
              ),
              ExtractedTextField(),
            ],
          ),
        ),
        const SizedBox(
          height: 20,
        ),
        const ResultButtons(),
      ],
    );
  }
}
