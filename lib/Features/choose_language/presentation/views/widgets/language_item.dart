import 'package:flutter/material.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/utils/get_responsive_font_size.dart';

class LanguageItem extends StatelessWidget {
  const LanguageItem({
    super.key,
    required this.language,
    required this.selectedLanguage,
  });
  final String language;
  final String selectedLanguage;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 0.6,
          color: Colors.grey,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      padding: const EdgeInsets.symmetric(horizontal: 12),
      margin: const EdgeInsets.only(top: 8),
      height: 38,
      child: Row(
        children: [
          selectedLanguage == language
              ? const Icon(
                  Icons.radio_button_checked,
                  color: kPrimaryColor,
                  size: 21,
                )
              : const Icon(
                  Icons.radio_button_unchecked,
                  color: Colors.grey,
                  size: 21,
                ),
          const SizedBox(
            width: 10,
          ),
          Text(
            language,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: getResponsiveFontSize(context, fontSize: 15),
            ),
          ),
        ],
      ),
    );
  }
}
