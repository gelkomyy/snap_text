import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snap_text/Features/choose_language/presentation/views/choose_language_view.dart';

CroppedFile? pickedImage;
Future<void> pickImage(BuildContext context, ImageSource source) async {
  final pickedFile = await ImagePicker().pickImage(source: source);

  if (pickedFile != null) {
    CroppedFile? croppedFile = await _cropImage(File(pickedFile.path));
    if (croppedFile != null) {
      pickedImage = croppedFile;

      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ChooseLanguageView(croppedFile: pickedImage!);
      }));
    }
  }
}

Future<CroppedFile?> _cropImage(File imageFile) async {
  return await ImageCropper().cropImage(
    sourcePath: imageFile.path,
    compressQuality: 100,
    //maxWidth: 800,
    //maxHeight: 800,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: const Color(0xff3F54FF),

        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
        hideBottomControls: true,

        //   hideBottomControls: true,
      ),
      IOSUiSettings(
        title: 'Crop Image',
        doneButtonTitle: 'Done',
        cancelButtonTitle: 'Cancel',
        aspectRatioLockEnabled: false,
      ),
    ],
  );
}
