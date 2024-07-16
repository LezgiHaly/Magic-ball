import 'package:dio/dio.dart';
import 'package:surf_flutter_courses_template/assets/strings.dart';

/// Запрос на сервер
class BallRepository {
  final String url = 'https://eightballapi.com/api';
  final dio = Dio();

  Future<String> getString() async {
    try {
      final response = await dio.get(
        url,
      );

      Map<String, dynamic> data = response.data;
      return data['reading'];
      // ignore: unused_catch_clause
    } on DioException catch (e) {
      return AppString.eror;
    }
  }
}
