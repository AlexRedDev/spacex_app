import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/src/bloc/app_bloc.dart';
import 'package:spacex_app/src/bloc/app_event.dart';
import 'package:spacex_app/src/bloc/app_state.dart';
import 'package:spacex_app/src/screens/home/widget/bottom_loader.dart';
import 'package:spacex_app/src/screens/home/widget/launches_item.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final _scrollController = ScrollController();
  final _textController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _listLauches(),
    );
  }

  AppBar _appBar() {
    return AppBar(
      title: Container(
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(15),
        ),
        child: TextField(
          cursorColor: Colors.white,
          style: Theme.of(context).textTheme.headline2,
          controller: _textController,
          onChanged: (value) {
            if (value.length <= 3) return;
            context.read<AppBloc>().add(ChangedMissionName(value));
            context.read<AppBloc>().add(FetchLaunches());
          },
          textAlign: TextAlign.center,
          decoration: const InputDecoration(
            border: InputBorder.none,
            hintText: 'Enter mission name',
            hintStyle: TextStyle(color: Colors.white54),
          ),
        ),
      ),
    );
  }

  Widget _listLauches() {
    return BlocBuilder<AppBloc, AppState>(
      builder: (context, state) {
        switch (state.status) {
          case LaunchesStatus.initial:
            return _initialState();
          case LaunchesStatus.succes:
            return _successState(state);
          case LaunchesStatus.failure:
            return _failureState(state.error);
        }
      },
    );
  }

  Widget _initialState() {
    return Container();
  }

  Widget _successState(AppState state) {
    return ListView.builder(
      controller: _scrollController,
      itemCount: state.hasReachedMax
          ? state.listLaunches.length
          : state.listLaunches.length + 1,
      itemBuilder: (context, index) {
        return index >= state.listLaunches.length
            ? const BottomLoader()
            : LaunchesItem(launches: state.listLaunches[index]);
      },
    );
  }

  Widget _failureState(String errorMessage) {
    return Center(
      child: Text(
        errorMessage,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodyText1,
      ),
    );
  }

  void _onScroll() {
    if (_isBottom) {
      context.read<AppBloc>().add(ReFetchLaunches());
    }
  }

  bool get _isBottom {
    if (!_scrollController.hasClients) return false;
    final maxScroll = _scrollController.position.maxScrollExtent;
    final currentScroll = _scrollController.offset;
    return currentScroll >= (maxScroll * 0.9);
  }
}
