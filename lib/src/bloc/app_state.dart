import 'package:spacex_app/src/models/launches.dart';

enum LaunchesStatus {
  initial,
  succes,
  failure,
}

class AppState {
  final LaunchesStatus status;
  final List<Launches> listLaunches;
  final bool hasReachedMax;

  AppState({
    this.status = LaunchesStatus.initial,
    this.listLaunches = const [],
    this.hasReachedMax = false,
  });

  AppState copyWith({
    LaunchesStatus? status,
    List<Launches>? listLaunches,
    bool? hasReachedMax,
  }) {
    return AppState(
      status: status ?? this.status,
      listLaunches: listLaunches ?? this.listLaunches,
      hasReachedMax: hasReachedMax ?? this.hasReachedMax,
    );
  }
}
