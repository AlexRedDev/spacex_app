import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/src/bloc/app_event.dart';
import 'package:spacex_app/src/bloc/app_state.dart';

class AppBloc extends Bloc<AppEvent, AppState> {
  AppBloc() : super(AppState());
}
