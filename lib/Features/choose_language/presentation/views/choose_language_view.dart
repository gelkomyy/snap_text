import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/choose_language/presentation/manager/get_extracted_text_from_image_cubit/get_extracted_text_from_image_cubit.dart';
import 'package:snap_text/Features/choose_language/presentation/views/widgets/language_view_body.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';

class ChooseLanguageView extends StatelessWidget {
  const ChooseLanguageView({super.key, required this.croppedFile});
  final File croppedFile;

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
    return BlocProvider(
      create: (context) => GetExtractedTextFromImageCubit(),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: kAccentColor,
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
      ),
    );
  }
}
