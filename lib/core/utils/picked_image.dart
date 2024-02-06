import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snap_text/Features/choose_language/presentation/views/choose_language_view.dart';
import 'package:snap_text/constans.dart';

File? pickedImage;
Future<void> pickImage(BuildContext context, ImageSource source) async {
  final pickedFile = await ImagePicker().pickImage(source: source);

  if (pickedFile != null) {
    File? croppedFile = await _cropImage(File(pickedFile.path));
    if (croppedFile != null) {
      pickedImage = croppedFile;
      if (!context.mounted) return;
      Navigator.of(context).push(MaterialPageRoute(builder: (context) {
        return ChooseLanguageView(croppedFile: pickedImage!);
      }));
    }
  }
}

Future<File?> _cropImage(File imageFile) async {
  File? newFile;
  CroppedFile? croppedFile = await ImageCropper().cropImage(
    sourcePath: imageFile.path,
    compressQuality: 100,
    //maxWidth: 800,
    //maxHeight: 800,
    uiSettings: [
      AndroidUiSettings(
        toolbarTitle: 'Crop Image',
        toolbarColor: kPrimaryColor,
        toolbarWidgetColor: Colors.white,
        initAspectRatio: CropAspectRatioPreset.original,
        lockAspectRatio: false,
        hideBottomControls: true,
      ),
      IOSUiSettings(
        title: 'Crop Image',
        doneButtonTitle: 'Done',
        cancelButtonTitle: 'Cancel',
        aspectRatioLockEnabled: false,
      ),
    ],
  );

  // Rename the cropped file to the original file name manually
  if (croppedFile != null) {
    String originalFileName = imageFile.path.split(Platform.pathSeparator).last;
    var lastSeparator = croppedFile.path.lastIndexOf(Platform.pathSeparator);
    String newPath =
        '${croppedFile.path.substring(0, lastSeparator + 1)}$originalFileName';
    await imageFile.delete();
    newFile = await File(croppedFile.path).rename(newPath);
  }
  return newFile;
}
