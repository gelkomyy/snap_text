import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/loading_list_item.dart';

class ListItemsLoading extends StatelessWidget {
  const ListItemsLoading({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      enabled: true,
      child: ListView.builder(
          itemCount: 10,
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            return const LoadingListItem();
          }),
    );
  }
}
