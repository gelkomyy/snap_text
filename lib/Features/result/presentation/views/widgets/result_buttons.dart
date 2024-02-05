import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:snap_text/Features/result/presentation/views/widgets/custom_icon_button_circle.dart';
import 'package:snap_text/core/utils/custom_snack_bar.dart';

class ResultButtons extends StatelessWidget {
  const ResultButtons({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () {
            Clipboard.setData(const ClipboardData(text: 'hey from Copy')).then(
              (value) => showCutomSnackBar(context, 'Text copied to clipboard'),
            );
          },
          child: const CustomIconButtonCircle(
            iconData: Icons.copy,
          ),
        ),
        GestureDetector(
          onTap: () {
            showCutomSnackBar(context, 'Saved.');
          },
          child: const CustomIconButtonCircle(
            iconData: Icons.save,
          ),
        ),
      ],
    );
  }
}
