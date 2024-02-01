import 'package:flutter/material.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/history_item_data.dart';

class HistoryItem extends StatelessWidget {
  const HistoryItem({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
      ),
      margin: const EdgeInsets.only(top: 10),
      height: 60,
      child: const HistoryItemData(),
    );
  }
}
