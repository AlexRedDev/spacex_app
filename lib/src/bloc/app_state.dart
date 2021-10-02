import 'package:spacex_app/src/models/launches.dart';

enum LaunchesStatus {
  initial,
  succes,
  failure,
}

class AppState {
  final String missionName;
  final LaunchesStatus status;
  final List<Launches> listLaunches;
  final bool hasReachedMax;
  final String error;

  AppState({
    this.missionName = '',
    this.status = LaunchesStatus.initial,
    this.listLaunches = const [],
    this.hasReachedMax = false,
    this.error = '',
  });

  AppState copyWith({
    String? missionName,
    LaunchesStatus? status,
    List<Launches>? listLaunches,
    bool? hasReachedMax,
    String? error,
  }) {
    return AppState(
      missionName: missionName ?? this.missionName,
      status: status ?? this.status,
      listLaunches: listLaunches ?? this.listLaunches,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
      error: error ?? this.error,
    );
  }
}
