import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/choose_language/presentation/views/widgets/language_item.dart';
import 'package:snap_text/Features/home/presentation/manager/database_manager_cubit/database_manager_cubit.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/languages_enum.dart';

class CLanguagesListView extends StatelessWidget {
  const CLanguagesListView({super.key, required this.imageModel});
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseManagerCubit, DatabaseManagerState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
              itemCount: LanguagesEnum.values.length,
              itemBuilder: (context, index) {
                return InkWell(
                  onTap: () {
                    imageModel.selectedLanguage = LanguagesEnum.values[index];

                    BlocProvider.of<DatabaseManagerCubit>(context)
                        .editWithoutInsert();
                  },
                  child: LanguageItem(
                    language: LanguagesEnum.values[index].displayName,
                    selectedLanguage: imageModel.selectedLanguage.displayName,
                  ),
                );
              }),
        );
      },
    );
  }
}
