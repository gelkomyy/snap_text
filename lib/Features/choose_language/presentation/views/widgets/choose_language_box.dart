import 'package:flutter/material.dart';
import 'package:snap_text/Features/choose_language/presentation/views/widgets/choose_language_box_items.dart';
import 'package:snap_text/core/models/image_model.dart';

class ChooseLanguageBox extends StatelessWidget {
  const ChooseLanguageBox({
    super.key,
    required this.imageModel,
  });
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return Container(
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
      child: ChooseLanguageBoxItems(imageModel: imageModel),
    );
  }
}
