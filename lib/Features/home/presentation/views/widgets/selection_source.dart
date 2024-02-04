//import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/selection_source_item.dart';
import 'package:snap_text/core/utils/picked_image.dart';

class SelectionSource extends StatelessWidget {
  const SelectionSource({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        InkWell(
          onTap: () {
            pickImage(context, ImageSource.camera);
          },
          child: const SelectionSourceItem(
            text: 'Camera',
            iconData: Icons.photo_camera,
          ),
        ),
        InkWell(
          onTap: () async {
            pickImage(context, ImageSource.gallery);
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
