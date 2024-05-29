import 'package:dio/dio.dart';
import 'package:surf_flutter_courses_template/assets/strings.dart';

/// Запрос на сервер

class ApiRepositories {
  final String url = 'https://eightballapi.com/api';
  final dio = Dio();

  Future<String> getString() async {
    final response = await dio.get(url);

    Map<String, dynamic> data = response.data;
    return data['reading'] ?? AppString.eror;
  }
}
