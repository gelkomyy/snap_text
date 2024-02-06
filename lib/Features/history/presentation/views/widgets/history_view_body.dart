import 'package:flutter/material.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/history_sliver_list.dart';

class HistoryViewBody extends StatelessWidget {
  const HistoryViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: CustomScrollView(
        slivers: [
          HistorySliverList(),
        ],
      ),
    );
  }
}
