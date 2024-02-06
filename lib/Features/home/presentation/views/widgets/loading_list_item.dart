import 'package:flutter/material.dart';

class LoadingListItem extends StatelessWidget {
  const LoadingListItem({
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
    );
  }
}
