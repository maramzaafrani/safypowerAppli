import 'package:dio/dio.dart';

class ApiService {
  static const String BASE_URL = 'https://api.example.com';

  final Dio _dio = Dio(BaseOptions(
    baseUrl: BASE_URL,
    connectTimeout: Duration(milliseconds: 5000),
    receiveTimeout: Duration(milliseconds: 3000),
  ));

  Future<Response> fetchData(String endpoint) async {
    try {
      Response response = await _dio.get(endpoint);
      return response;
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }
}
