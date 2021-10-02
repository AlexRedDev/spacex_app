import 'package:bloc_concurrency/bloc_concurrency.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rxdart/rxdart.dart';
import 'package:spacex_app/src/bloc/app_event.dart';
import 'package:spacex_app/src/bloc/app_state.dart';
import 'package:spacex_app/src/repository/repository.dart';

const throttleDuration = Duration(seconds: 1);

EventTransformer<E> throttleDroppable<E>(Duration duration) {
  return (events, mapper) {
    return droppable<E>().call(events.throttleTime(duration), mapper);
  };
}

class AppBloc extends Bloc<AppEvent, AppState> {
  final Repository repository;

  int offset = 1;

  AppBloc({required this.repository}) : super(AppState()) {
    on<ChangedMissionName>(_changedMissionName);
    on<FetchLaunches>(_fetchLaunches);
    on<ReFetchLaunches>(
      _reFetchLaunches,
      transformer: throttleDroppable(throttleDuration),
    );
  }

  Future<void> _changedMissionName(
    ChangedMissionName event,
    Emitter<AppState> emit,
  ) async {
    emit(state.copyWith(missionName: event.missionName));
  }

  Future<void> _fetchLaunches(
    FetchLaunches event,
    Emitter<AppState> emit,
  ) async {
    try {
      offset = 0;
      final list = await repository.getLaunches(nameMission: state.missionName);
      emit(state.copyWith(
        status: LaunchesStatus.succes,
        listLaunches: list,
        hasReachedMax: false,
      ));
    } catch (e) {
      emit(state.copyWith(
        status: LaunchesStatus.failure,
        error: e.toString(),
      ));
    }
  }

  Future<void> _reFetchLaunches(
    ReFetchLaunches event,
    Emitter<AppState> emit,
  ) async {
    try {
      if (state.hasReachedMax) return;
      final list = await repository.getLaunches(
        nameMission: state.missionName,
        offset: offset,
      );
      if (list.isEmpty) {
        emit(state.copyWith(
          status: LaunchesStatus.succes,
          hasReachedMax: true,
        ));
      } else {
        emit(state.copyWith(
          status: LaunchesStatus.succes,
          listLaunches: List.of(state.listLaunches)..addAll(list),
          hasReachedMax: false,
        ));
        offset++;
      }
    } catch (e) {
      emit(state.copyWith(
        status: LaunchesStatus.failure,
        error: e.toString(),
      ));
    }
  }

  // @override
  // Stream<Transition<AppEvent, AppState>> transformEvents(
  //   Stream<AppEvent> events,
  //   TransitionFunction<AppEvent, AppState> transitionFn,
  // ) {
  //   return super.transformEvents(
  //       events.throttleTime(const Duration(seconds: 1)), transitionFn);
  // }

  // @override
  // Stream<AppState> mapEventToState(AppEvent event) async* {
  //   if (event is FetchLaunches) {
  //     if (state.hasReachedMax) return;
  //     if (state.status == LaunchesStatus.initial) {
  //       try {
  //         final list =
  //             await repository.getLaunches(nameMission: state.missionName);
  //         yield state.copyWith(
  //             status: LaunchesStatus.succes,
  //             listLaunches: list,
  //             hasReachedMax: false);
  //       } catch (e) {
  //         yield state.copyWith(
  //             status: LaunchesStatus.failure,
  //             error: e.toString(),
  //             hasReachedMax: false);
  //       }
  //     } else {
  //       try {
  //         final list = await repository.getLaunches(
  //           nameMission: state.missionName,
  //           offset: offset,
  //         );
  //         if (list.isEmpty) {
  //           yield state.copyWith(hasReachedMax: true);
  //         } else {
  //           offset++;
  //           yield state.copyWith(
  //             status: LaunchesStatus.succes,
  //             listLaunches: List.of(state.listLaunches)..addAll(list),
  //             hasReachedMax: false,
  //           );
  //         }
  //       } catch (e) {
  //         yield state.copyWith(
  //             status: LaunchesStatus.failure, error: e.toString());
  //       }
  //     }
  //   }
  // }
}
