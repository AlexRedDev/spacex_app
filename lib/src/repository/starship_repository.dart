import 'package:spacex_app/src/api/starship_api.dart';
import 'package:spacex_app/src/models/starship.dart';

class StarshipRepository {
  final _api = StarshipAPI();

  Future<List<Starship>> getAllStarships() async {
    final data = await _api.fetchAllStarships();
    throw UnimplementedError;
  }

  Future<Starship> getStarshipBy({required int id}) async {
    final data = await _api.fetchStarshipsBy(id: id);
    throw UnimplementedError;
  }
}
