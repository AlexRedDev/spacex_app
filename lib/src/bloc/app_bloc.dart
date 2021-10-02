import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/src/bloc/app_event.dart';
import 'package:spacex_app/src/bloc/app_state.dart';
import 'package:spacex_app/src/repository/repository.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc({required this.repository}) : super(AppState());

  final Repository repository;

  @override
  Stream<AppState> mapEventToState(AppEvent event) async* {
    if (event is FetchLaunches) {
      try {
        final list = await repository.getLaunches(event.searhcMission);
        yield state.copyWith(listLaunches: list, status: LaunchesStatus.succes);
      } catch (e) {
        yield state.copyWith(
            status: LaunchesStatus.failure, error: e.toString());
      }
    }
  }
}
