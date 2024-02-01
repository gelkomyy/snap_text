import 'package:flutter/material.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/history_item_name_and_date.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/history_item_photo.dart';

class HistoryItemData extends StatelessWidget {
  const HistoryItemData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Row(
      children: [
        HistoryItemPhoto(),
        HistoryItemNameAndDate(),
      ],
    );
  }
}
