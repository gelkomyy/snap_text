import 'package:flutter/material.dart';

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
                  color: Color(0xff3F54FF),
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
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
