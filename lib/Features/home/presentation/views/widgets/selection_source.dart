import 'package:flutter/material.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/selection_source_item.dart';

class SelectionSource extends StatelessWidget {
  const SelectionSource({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        SelectionSourceItem(
          text: 'Camera',
          iconData: Icons.photo_camera,
        ),
        SelectionSourceItem(
          text: 'Gallery',
          iconData: Icons.photo_library,
        ),
      ],
    );
  }
}
