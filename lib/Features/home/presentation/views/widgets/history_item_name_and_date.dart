import 'package:flutter/material.dart';

class HistoryItemNameAndDate extends StatelessWidget {
  const HistoryItemNameAndDate({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'IMG2018- 41041a ',
          style: TextStyle(fontSize: 17, fontWeight: FontWeight.w500),
        ),
        Row(
          children: [
            Text(
              '03:40 PM •',
              style: TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              ' Dec 29,2023',
              style: TextStyle(
                  fontSize: 10,
                  color: Color(0xff3F54FF),
                  fontWeight: FontWeight.w500),
            ),
          ],
        )
      ],
    );
  }
}
