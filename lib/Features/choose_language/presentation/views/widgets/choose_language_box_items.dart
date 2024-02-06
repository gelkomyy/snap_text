import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/home/presentation/manager/database_manager_cubit/database_manager_cubit.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/utils/languages_enum.dart';

class ChooseLanguageBoxItems extends StatelessWidget {
  const ChooseLanguageBoxItems({
    super.key,
    required this.imageModel,
  });
  final ImageModel imageModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<DatabaseManagerCubit, DatabaseManagerState>(
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
              state is DatabaseManagerInitial
                  ? 'Choose a language'
                  : imageModel.selectedLanguage.displayName,
              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w600),
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
