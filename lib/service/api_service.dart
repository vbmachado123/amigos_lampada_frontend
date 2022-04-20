import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

// ignore: constant_identifier_names
  static const String _BASE_URL = 'http://192.168.0.10:8080/api/v1';
  // static const String _BASE_URL = 'http://192.168.0.110:8080/api/v1';

  get(String url) async {
    dio.options.headers["Access-Control-Allow-Origin"] = "*";
    dio.options.headers["Access-Control-Allow-Credentials"] = true;
    dio.options.headers["Access-Control-Allow-Headers"] =
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
    dio.options.headers["Access-Control-Allow-Methods"] =
        "GET, HEAD, POST, OPTIONS";
    print('Chamando API');
    try {
      Response response = await dio.get('$_BASE_URL/$url');

      print(response.data);
      if (response.statusCode == 200) {
        print('Resposta API: ${response.data}');
        return response.data;
      } else if (response.statusCode == 400) {
        print('Erro');
        return null;
      }
    } catch (e) {
      print('Erro: $e');
      // print('Erro API: ${e.toString()}');
    }
  }

  post(String url, var dto) async {
    dio.options.headers["Access-Control-Allow-Origin"] = "*";
    dio.options.headers["Access-Control-Allow-Credentials"] = true;
    dio.options.headers["Access-Control-Allow-Headers"] =
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale";
    dio.options.headers["Access-Control-Allow-Methods"] =
        "GET, HEAD, POST, OPTIONS";
    print('Chamando API');
    try {
      Response response = await dio.post(
        '$_BASE_URL/$url',
        data: dto,
      );
      print('Resposta API: ${response.data}');
      return response.data;
    } catch (e) {
      print('Erro API: ${e.toString()}');
    }
  }
}
