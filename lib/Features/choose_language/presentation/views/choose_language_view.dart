import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:snap_text/Features/choose_language/presentation/views/widgets/language_view_body.dart';
import 'package:snap_text/core/models/image_model.dart';

class ChooseLanguageView extends StatelessWidget {
  const ChooseLanguageView({super.key, required this.croppedFile});
  final CroppedFile croppedFile;

  String _addLeadingZero(int value) {
    return value < 10 ? '0$value' : '$value';
  }

  String _getCurrentDate() {
    DateTime now = DateTime.now();
    return "${_addLeadingZero(now.hour)}:${_addLeadingZero(now.minute)} "
        "${(now.hour < 12) ? 'AM' : 'PM'} ${_addLeadingZero(now.day)}/${_addLeadingZero(now.month)}/${now.year}";
  }

  ImageModel get imageModel =>
      ImageModel(path: croppedFile.path, dateHistory: _getCurrentDate());

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
      body: SafeArea(child: LanguageViewBody(imageModel: imageModel)),
    );
  }
}
