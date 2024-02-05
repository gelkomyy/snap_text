import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:snap_text/core/utils/get_extracted_text.dart';
import 'package:snap_text/core/utils/languages_enum.dart';

part 'get_extracted_text_from_image_state.dart';

class GetExtractedTextFromImageCubit
    extends Cubit<GetExtractedTextFromImageState> {
  GetExtractedTextFromImageCubit() : super(GetExtractedTextFromImageLoading());

  Future<String> getExtractedTextFromImage(
      {required File file,
      LanguagesEnum language = LanguagesEnum.english}) async {
    emit(GetExtractedTextFromImageLoading());
    String extractedText = await GetExtractedTextApi()
        .getTextFromApi(file: file, language: language);
    emit(GetExtractedTextFromImageDone());
    return extractedText;
  }
}
