import 'package:equatable/equatable.dart';

abstract class AppEvent extends Equatable {}

class ChangedMissionName extends AppEvent {
  final String missionName;
  ChangedMissionName(this.missionName);

  @override
  List<Object?> get props => [missionName];
}

class FetchLaunches extends AppEvent {
  @override
  List<Object?> get props => [];
}

class ReFetchLaunches extends AppEvent {
  @override
  List<Object?> get props => [];
}
