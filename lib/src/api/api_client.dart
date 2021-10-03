import 'package:spacex_app/src/models/launches.dart';

abstract class ApiClient {
  Future<List<Launches>> fetchLaunches(String missionName, int offset);
}
