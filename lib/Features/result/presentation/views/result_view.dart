import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/home/presentation/manager/database_manager_cubit/database_manager_cubit.dart';
import 'package:snap_text/Features/result/presentation/views/widgets/result_view_body.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/show_confirmation_dialog.dart';

class ResultView extends StatelessWidget {
  const ResultView(
      {super.key, required this.imageModel, required this.previousView});
  final ImageModel imageModel;
  final String previousView;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () async {
              bool delete = await showConfirmationDialog(
                  context: context,
                  text: 'Are sure you want to delete this file?');
              if (delete) {
                String boxName = historyBox;
                if (previousView == historyBox) {
                  boxName = historyBox;
                } else if (previousView == bookmarkBox) {
                  boxName = bookmarkBox;
                }
                if (!context.mounted) return;
                await BlocProvider.of<DatabaseManagerCubit>(context)
                    .deleteModel(
                        imageModel: imageModel,
                        boxName: boxName,
                        context: context);
                if (!context.mounted) return;
                Navigator.of(context).pop();
              }
            },
            icon: const Icon(Icons.delete),
          ),
        ],
        elevation: 0,
        backgroundColor: kAccentColor,
        title: const Text(
          'Result',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      backgroundColor: kAccentColor,
      body: SafeArea(
        child: ResultViewBody(imageModel: imageModel),
      ),
    );
  }
}
