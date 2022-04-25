import 'package:dio/dio.dart';

class ApiService {
  final Dio dio = Dio();

  // ignore: constant_identifier_names
  static const String _BASE_URL = 'http://192.168.0.10:8080/api/v1';
  // static const String _BASE_URL = 'http://192.168.0.110:8080/api/v1';

  get(String url) async {
    print('Chamando API');
    try {
      Response response = await dio.get('$_BASE_URL/$url');
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

  put(String url, var dto) async {
    try {
      Response response = await dio.put('$_BASE_URL/$url', data: dto);
      return response.data;
    } catch (e) {
      print('Erro API: ${e.toString()}');
    }
  }
}
