import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/choose_language/presentation/manager/get_extracted_text_from_image_cubit/get_extracted_text_from_image_cubit.dart';
import 'package:snap_text/Features/choose_language/presentation/views/widgets/choose_language_box.dart';
import 'package:snap_text/Features/choose_language/presentation/views/widgets/language_dialog.dart';
import 'package:snap_text/Features/home/presentation/manager/change_language_without_insert_cubit/change_language_without_insert_cubit.dart';
import 'package:snap_text/Features/home/presentation/manager/database_manager_cubit/database_manager_cubit.dart';
import 'package:snap_text/Features/result/presentation/views/result_view.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';

class BottomOfLanguageView extends StatelessWidget {
  const BottomOfLanguageView({
    super.key,
    required this.imageModel,
  });
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      InkWell(
        onTap: () {
          showDialog(
              context: context,
              builder: (_) {
                return BlocProvider.value(
                  value: BlocProvider.of<ChangeLanguageWithoutInsertCubit>(
                      context),
                  child: LanguageDialog(
                    imageModel: imageModel,
                  ),
                );
              });
          BlocProvider.of<ChangeLanguageWithoutInsertCubit>(context)
              .editWithoutInsert();
        },
        child: ChooseLanguageBox(imageModel: imageModel),
      ),
      const SizedBox(
        height: 16,
      ),
      Container(
        margin: const EdgeInsets.only(left: 20, right: 20, bottom: 5),
        width: double.infinity,
        height: 46,
        child: ElevatedButton(
          onPressed: () async {
            onTapExtract(context);
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: kPrimaryColor,
          ),
          child: const Text(
            'Extract Text',
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w500,
              fontSize: 18,
            ),
          ),
        ),
      ),
    ]);
  }

  onTapExtract(BuildContext context) async {
    String extractedText =
        await BlocProvider.of<GetExtractedTextFromImageCubit>(context)
            .getExtractedTextFromImage(
                file: File(imageModel.path),
                language: imageModel.selectedLanguage);
    imageModel.extractedText = extractedText;
    if (!context.mounted) return;
    BlocProvider.of<DatabaseManagerCubit>(context).insertModel(
        imageModel: imageModel, boxName: historyBox, context: context);
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) {
      return ResultView(imageModel: imageModel);
    }));
  }
}
