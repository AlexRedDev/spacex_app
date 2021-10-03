import 'package:spacex_app/src/api/graphql_client.dart';
import 'package:spacex_app/src/models/launches.dart';

class Repository {
  final GraphQlApi _graphQlApi = GraphQlApi();

  Future<List<Launches>> getLaunches(
          {required String nameMission, int offset = 0}) async =>
      await _graphQlApi.fetchLaunches(nameMission, offset);
}
