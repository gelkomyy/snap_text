import 'package:flutter/material.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';

class HistoryItemNameAndDate extends StatelessWidget {
  const HistoryItemNameAndDate({
    super.key,
    required this.imageModel,
  });
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
            padding: const EdgeInsets.only(right: 10),
            child: Text(
              imageModel.name,
              overflow: TextOverflow.fade,
              maxLines: 1,
              softWrap: false,
              style: const TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        Row(
          children: [
            Text(
              '${imageModel.dateHistory.split(' ')[0]} ${imageModel.dateHistory.split(' ')[1]} •',
              style: const TextStyle(
                  fontSize: 10,
                  color: Colors.grey,
                  fontWeight: FontWeight.w500),
            ),
            Text(
              ' ${imageModel.dateHistory.split(' ').last}',
              style: const TextStyle(
                fontSize: 10,
                color: kPrimaryColor,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        )
      ],
    );
  }
}
