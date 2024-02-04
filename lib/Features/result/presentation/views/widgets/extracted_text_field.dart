import 'package:flutter/material.dart';

class ExtractedTextField extends StatelessWidget {
  const ExtractedTextField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(14),
            borderSide: const BorderSide(
              width: 0,
              style: BorderStyle.none,
            )),
        filled: true,
        fillColor: const Color(0xffF5F5F5),
        hintText: 'Extracted Text Hereeee',
      ),
      maxLines: 16,
    );
  }
}
