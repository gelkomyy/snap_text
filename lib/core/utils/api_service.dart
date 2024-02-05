import 'package:dio/dio.dart';

class ApiService {
  final _baseUrl = 'https://api.ocr.space/parse/';
  final Dio _dio;
  Future<Map<String, dynamic>> get({required String endPoint}) async {
    var response = await _dio.get('$_baseUrl$endPoint');

    return response.data;
  }

  Future<Map<String, dynamic>> post(
      {required String endPoint, required FormData formData}) async {
    var response = await _dio.post('$_baseUrl$endPoint', data: formData);

    return response.data;
  }

  ApiService(this._dio);
}
