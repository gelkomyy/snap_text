import 'package:flutter/material.dart';
import 'package:snap_text/Features/bookmark/presentation/views/widgets/bookmark_sliver_list.dart';

class BookmarkViewBody extends StatelessWidget {
  const BookmarkViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(12),
      child: CustomScrollView(
        slivers: [
          BookmarkSliverList(),
        ],
      ),
    );
  }
}
