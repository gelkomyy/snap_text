import 'dart:io';

import 'package:dio/dio.dart';
import 'package:snap_text/core/utils/api_service.dart';
import 'package:snap_text/core/utils/languages_enum.dart';

class GetExtractedText {
  ApiService apiService = ApiService(Dio());
  String apiKey = 'helloworld';
  Future<String> getTextFromApi({
    required File file,
    LanguagesEnum language = LanguagesEnum.english,
  }) async {
    FormData formData = FormData.fromMap({
      'apikey': apiKey,
      'file': await MultipartFile.fromFile(file.path,
          filename: file.path.split(Platform.pathSeparator).last),
      'language': language.shortCode,
    });
    var responseData =
        await apiService.post(endPoint: 'image', formData: formData);
    return responseData['ParsedResults'][0]['ParsedText'];
  }
}
