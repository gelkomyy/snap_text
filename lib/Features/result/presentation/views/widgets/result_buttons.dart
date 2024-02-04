import 'package:flutter/material.dart';
import 'package:snap_text/Features/result/presentation/views/widgets/custom_icon_button_circle.dart';

class ResultButtons extends StatelessWidget {
  const ResultButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CustomIconButtonCircle(
          iconData: Icons.copy,
        ),
        CustomIconButtonCircle(
          iconData: Icons.save,
        ),
      ],
    );
  }
}
