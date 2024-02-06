import 'package:flutter/material.dart';
import 'package:snap_text/constans.dart';

class CustomIconButtonCircle extends StatelessWidget {
  const CustomIconButtonCircle({
    super.key,
    required this.iconData,
  });
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 14),
      height: 60,
      width: 60,
      decoration: const BoxDecoration(
        color: kPrimaryColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        iconData,
        color: Colors.white,
        size: 28,
      ),
    );
  }
}
