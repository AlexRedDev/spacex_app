import 'package:spacex_app/src/api/graphql_client.dart';
import 'package:spacex_app/src/bloc/app_event.dart';
import 'package:spacex_app/src/models/launches.dart';

class Repository {
  final GraphQlApi _graphQlApi = GraphQlApi();

  Future<List<Launches>> getLaunches(String nameMission,
      [int offset = 0]) async {
    try {
      final list = _graphQlApi.fetchLaunches(
        missionName: nameMission,
        offset: offset,
      );
      return list;
    } on Exception {
      throw (Exception);
    }
  }
}
