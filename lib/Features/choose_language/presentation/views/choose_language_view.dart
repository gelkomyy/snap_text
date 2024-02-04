import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:snap_text/Features/choose_language/presentation/views/widgets/language_view_body.dart';

class ChooseLanguageView extends StatelessWidget {
  const ChooseLanguageView({super.key, required this.croppedFile});
  final CroppedFile croppedFile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color(0xffFAFBFD),
        title: const Text(
          'Language',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: Colors.black,
      body: SafeArea(child: LanguageViewBody(croppedFile: croppedFile)),
    );
  }
}
