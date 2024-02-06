import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:snap_text/Features/choose_language/presentation/manager/get_extracted_text_from_image_cubit/get_extracted_text_from_image_cubit.dart';
import 'package:snap_text/Features/choose_language/presentation/views/widgets/bottom_of_language_view.dart';
import 'package:snap_text/constans.dart';
import 'package:snap_text/core/models/image_model.dart';
import 'package:snap_text/core/widgets/loading_overlay_blured.dart';

class LanguageViewBody extends StatelessWidget {
  const LanguageViewBody({
    super.key,
    required this.imageModel,
  });

  final ImageModel imageModel;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetExtractedTextFromImageCubit,
        GetExtractedTextFromImageState>(
      builder: (context, state) {
        return LoadingOverlayBlured(
          isLoading: state is GetExtractedTextFromImageLoading,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: Align(
                  alignment: Alignment.center,
                  child: Image.file(
                    File(imageModel.path),
                  ),
                ),
              ),
              Container(
                color: kAccentColor,
                child: BottomOfLanguageView(
                  imageModel: imageModel,
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
