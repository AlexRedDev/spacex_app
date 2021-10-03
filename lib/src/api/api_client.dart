import 'package:spacex_app/src/models/launches.dart';

abstract class ApiClient {
  Future<List<Launches>> fetchLaunches(String missionName);

  Future<List<Launches>> reFetchLaunches(String missionName);
}
