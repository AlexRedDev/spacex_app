import 'package:spacex_app/src/api/starship_api.dart';
import 'package:spacex_app/src/models/starship.dart';

class StarshipRepository {
  final _api = StarshipAPI();

  Future<List<Starship>> getAllStarships({
    int limit = 10,
    required int offset,
  }) async {
    final response = await _api.fetchAllStarships(limit: limit, offset: offset);
    return response.map((e) => Starship.fromJson(e)).toList();
  }

  Future<Starship> getStarshipBy({required int id}) async {
    throw UnimplementedError;
  }
}
