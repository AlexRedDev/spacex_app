import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/src/models/starship.dart';
import 'package:spacex_app/src/repository/starship_repository.dart';

enum Progress {
  initial,
  loading,
  loaded,
  error,
}

class StarshipState {
  final List<Starship>? starships;
  final Starship? selected;
  final Progress status;

  StarshipState({
    this.starships,
    this.selected,
    this.status = Progress.initial,
  });

  StarshipState copyWith({
    List<Starship>? starships,
    Starship? selected,
    Progress? status,
  }) {
    return StarshipState(
      starships: starships ?? this.starships,
      selected: selected ?? this.selected,
      status: status ?? this.status,
    );
  }
}

class StarshipCubit extends Cubit<StarshipState> {
  StarshipCubit() : super(StarshipState()) {
    _init();
  }

  final _repository = StarshipRepository();

  void _init() async {
    emit(state.copyWith(status: Progress.loading));

    final starships = await _repository.getAllStarships(offset: 1);
    emit(state.copyWith(status: Progress.loaded, starships: starships));
  }
}
