import 'package:flutter/material.dart';
import 'package:snap_text/Features/home/presentation/views/widgets/history_item_data.dart';
import 'package:snap_text/Features/result/presentation/views/result_view.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';

class BookmarkItem extends StatelessWidget {
  const BookmarkItem({
    super.key,
    required this.imageModel,
  });
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) {
          return ResultView(
            imageModel: imageModel,
            previousView: bookmarkBox,
          );
        }));
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Colors.grey,
          ),
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        margin: const EdgeInsets.only(top: 10),
        height: 60,
        child: HistoryItemData(imageModel: imageModel),
      ),
    );
  }
}
