import 'package:flutter/material.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/history_item_name_and_date.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/history_item_photo.dart';
import 'package:snap_text/core/models/image_model.dart';

class HistoryItemData extends StatelessWidget {
  const HistoryItemData({
    super.key,
    required this.imageModel,
  });
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HistoryItemPhoto(imageModel: imageModel),
        Expanded(child: HistoryItemNameAndDate(imageModel: imageModel)),
      ],
    );
  }
}
