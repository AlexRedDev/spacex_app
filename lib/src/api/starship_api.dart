import 'package:dio/dio.dart';
import 'package:spacex_app/src/app/client_http.dart';

class StarshipAPI {
  Future<List<dynamic>> fetchAllStarships({
    required int limit,
    required int offset,
  }) async {
    final response = await HttpClient.api.get('/ships');
    return response.data;
  }

  Future<Map<String, dynamic>> fetchStarshipsBy({required int id}) async {
    throw UnimplementedError;
  }
}
