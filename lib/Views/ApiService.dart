import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

import '../service/api_service.dart';

class DioDemo extends StatefulWidget {
  @override
  _DioDemoState createState() => _DioDemoState();
}

class _DioDemoState extends State<DioDemo> {
  final ApiService _apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Dio Demo'),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            _fetchData();
          },
          child: Text('Fetch Data'),
        ),
      ),
    );
  }

  void _fetchData() async {
    try {
      Response response = await _apiService.fetchData('/posts');
      print(response.data);

    } catch (e) {

      print('Error fetching data: $e');
      if (e is DioError) {

      }
    }
  }
}
