import 'package:flutter/material.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/history_item.dart';

class HistorySliverList extends StatelessWidget {
  const HistorySliverList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SliverList.builder(
      itemCount: 50,
      itemBuilder: (context, index) {
        return const HistoryItem();
      },
    );
  }
}
