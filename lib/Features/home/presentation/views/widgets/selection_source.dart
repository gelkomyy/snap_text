//import 'dart:io';

import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snap_text/Features/home/presentation/choose_language_view.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/selection_source_item.dart';

class SelectionSource extends StatefulWidget {
  const SelectionSource({
    super.key,
  });

  @override
  State<SelectionSource> createState() => _SelectionSourceState();
}

class _SelectionSourceState extends State<SelectionSource> {
  CroppedFile? _pickedImage;

  Future<void> _pickImage(ImageSource source) async {
    final pickedFile = await ImagePicker().pickImage(source: source);

    if (pickedFile != null) {
      CroppedFile? croppedFile = await _cropImage(File(pickedFile.path));
      if (croppedFile != null) {
        setState(() {
          _pickedImage = croppedFile;
        });

        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ChooseLanguageView(croppedFile: _pickedImage!);
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

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            _pickImage(ImageSource.camera);
          },
          child: const SelectionSourceItem(
            text: 'Camera',
            iconData: Icons.photo_camera,
          ),
        ),
        InkWell(
          onTap: () async {
            _pickImage(ImageSource.gallery);
          },
          child: const SelectionSourceItem(
            text: 'Gallery',
            iconData: Icons.photo_library,
          ),
        ),
      ],
    );
  }
}
