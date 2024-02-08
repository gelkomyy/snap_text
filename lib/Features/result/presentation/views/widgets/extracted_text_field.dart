import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/home/presentation/manager/database_manager_cubit/database_manager_cubit.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/get_responsive_font_size.dart';
import 'package:snap_text/core/utils/languages_enum.dart';

class ExtractedTextField extends StatelessWidget {
  final ImageModel imageModel;
  const ExtractedTextField({
    super.key,
    required this.imageModel,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          initialValue: imageModel.extractedText,
          textDirection: imageModel.selectedLanguage == LanguagesEnum.arabic
              ? TextDirection.rtl
              : TextDirection.ltr,
          onChanged: (value) {
            imageModel.extractedText = value;
            BlocProvider.of<DatabaseManagerCubit>(context).saveAfterEditedModel(
                imageModel: imageModel, boxName: historyBox);
          },
          decoration: InputDecoration(
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(14),
                borderSide: const BorderSide(
                  width: 0,
                  style: BorderStyle.none,
                )),
            filled: true,
            fillColor: const Color(0xffF5F5F5),
            hintText: 'Extracted Text Here',
          ),
          maxLines: 16,
        ),
        Text(
          'scroll the text if large',
          style: TextStyle(
            fontSize: getResponsiveFontSize(context, fontSize: 10),
          ),
        )
      ],
    );
  }
}
