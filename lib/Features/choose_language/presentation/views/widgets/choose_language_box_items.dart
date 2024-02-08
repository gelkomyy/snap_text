import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/home/presentation/manager/change_language_without_insert_cubit/change_language_without_insert_cubit.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/get_responsive_font_size.dart';
import 'package:snap_text/core/utils/languages_enum.dart';

class ChooseLanguageBoxItems extends StatelessWidget {
  const ChooseLanguageBoxItems({
    super.key,
    required this.imageModel,
  });
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChangeLanguageWithoutInsertCubit,
        ChangeLanguageWithoutInsertState>(
      builder: (context, state) {
        return Row(
          children: [
            const Icon(
              Icons.translate,
              size: 30,
            ),
            const SizedBox(
              width: 12,
            ),
            Text(
              state is ChangeLanguageWithoutInsertInitial
                  ? 'Choose a language'
                  : imageModel.selectedLanguage.displayName,
              style: TextStyle(
                  fontSize: getResponsiveFontSize(context, fontSize: 17),
                  fontWeight: FontWeight.w600),
            ),
            const Spacer(),
            const Card(
              color: kPrimaryColor,
              child: Padding(
                padding: EdgeInsets.all(2),
                child: Icon(
                  Icons.arrow_forward,
                  size: 14,
                  color: Colors.white,
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
