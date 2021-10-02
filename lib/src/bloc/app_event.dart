abstract class AppEvent {}

class FetchLaunches extends AppEvent {
  final String searhcMission;
  FetchLaunches({required this.searhcMission});
}

