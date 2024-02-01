import 'package:flutter/material.dart';

class HistoryItemPhoto extends StatelessWidget {
  const HistoryItemPhoto({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      height: 40,
      width: 40,
      decoration: BoxDecoration(
        color: const Color(0xff3F54FF),
        borderRadius: BorderRadius.circular(12),
      ),
      child: const Icon(
        Icons.history,
        color: Colors.white,
      ),
    );
  }
}
