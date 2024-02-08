import 'package:flutter/material.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/utils/get_responsive_font_size.dart';

class SelectionSourceItem extends StatelessWidget {
  const SelectionSourceItem({
    super.key,
    required this.text,
    required this.iconData,
  });
  final String text;
  final IconData iconData;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 170,
      height: 180,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            shape: const CircleBorder(),
            color: kPrimaryColor,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Icon(
                iconData,
                size: 32,
                color: Colors.white,
              ),
            ),
          ),
          Text(
            text,
            style: TextStyle(
              fontSize: getResponsiveFontSize(context, fontSize: 26),
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}
