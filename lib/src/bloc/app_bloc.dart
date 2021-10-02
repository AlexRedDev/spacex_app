import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spacex_app/src/bloc/app_event.dart';
import 'package:spacex_app/src/bloc/app_state.dart';
import 'package:spacex_app/src/repository/repository.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.repository}) : super(AppState());

  final Repository repository;
  int offset = 1;

  @override
  Stream<Transition<AppEvent, AppState>> transformEvents(
    Stream<AppEvent> events,
    TransitionFunction<AppEvent, AppState> transitionFn,
  ) {
    return super.transformEvents(
        events.throttleTime(const Duration(seconds: 1)), transitionFn);
  }

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is FetchLaunches) {
      if (state.hasReachedMax) return;
      if (state.status == LaunchesStatus.initial) {
        try {
          final list =
              await repository.getLaunches(nameMission: event.searhcMission);
          yield state.copyWith(
              status: LaunchesStatus.succes,
              listLaunches: list,
              hasReachedMax: false);
        } catch (e) {
          yield state.copyWith(
              status: LaunchesStatus.failure,
              error: e.toString(),
              hasReachedMax: false);
        }
      } else {
        try {
          final list = await repository.getLaunches(
            nameMission: event.searhcMission,
            offset: offset,
          );
          if (list.isEmpty) {
            yield state.copyWith(hasReachedMax: true);
          } else {
            offset++;
            yield state.copyWith(
              status: LaunchesStatus.succes,
              listLaunches: List.of(state.listLaunches)..addAll(list),
              hasReachedMax: false,
            );
          }
        } catch (e) {
          yield state.copyWith(
              status: LaunchesStatus.failure, error: e.toString());
        }
      }
    }
  }
}
