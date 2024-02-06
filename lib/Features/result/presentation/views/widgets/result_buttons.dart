import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/home/presentation/manager/database_manager_cubit/database_manager_cubit.dart';
import 'package:snap_text/Features/result/presentation/views/widgets/custom_icon_button_circle.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/custom_snack_bar.dart';

class ResultButtons extends StatelessWidget {
  const ResultButtons({
    super.key,
    required this.imageModel,
  });
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        GestureDetector(
          onTap: () async {
            await Clipboard.setData(
                    ClipboardData(text: imageModel.extractedText))
                .then(
              (value) => showCutomSnackBar(context, 'Text copied to clipboard'),
            );
          },
          child: const CustomIconButtonCircle(
            iconData: Icons.copy,
          ),
        ),
        GestureDetector(
          onTap: () async {
            await BlocProvider.of<DatabaseManagerCubit>(context)
                .insertModel(
                    imageModel: ImageModel.copy(imageModel),
                    boxName: bookmarkBox)
                .then((value) => showCutomSnackBar(context, 'Saved.'));
          },
          child: const CustomIconButtonCircle(
            iconData: Icons.bookmark_add,
          ),
        ),
      ],
    );
  }
}
