import 'package:spacex_app/src/api/api_client.dart';
import 'package:spacex_app/src/api/graphql_client.dart';
import 'package:spacex_app/src/models/launches.dart';

class Repository {
  final ApiClient _apiClient = GraphQlApi();

  Future<List<Launches>> getLaunches({required String nameMission}) async =>
      await _apiClient.fetchLaunches(nameMission);

  Future<List<Launches>> loadMoreLauches({required String nameMission}) async =>
      await _apiClient.reFetchLaunches(nameMission);
}
