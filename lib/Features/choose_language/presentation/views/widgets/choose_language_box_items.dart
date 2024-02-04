import 'package:flutter/material.dart';

class ChooseLanguageBoxItems extends StatelessWidget {
  const ChooseLanguageBoxItems({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        Icon(
          Icons.translate,
          size: 30,
        ),
        SizedBox(
          width: 12,
        ),
        Text(
          'Choose a language',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
        ),
        Spacer(),
        Card(
          color: Color(0xff3F54FF),
          child: Padding(
            padding: EdgeInsets.all(2),
            child: Icon(
              Icons.arrow_forward,
              size: 14,
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
