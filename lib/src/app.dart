import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/src/bloc/app_bloc.dart';
import 'package:spacex_app/src/config/custom_theme.dart';
import 'package:spacex_app/src/repository/repository.dart';
import 'package:spacex_app/src/screens/home/home_view.dart';

class App extends StatelessWidget {
  const App({Key? key, required this.repository}) : super(key: key);
  final Repository repository;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: CustomTheme.dark,
      title: 'SpaceX',
      home: BlocProvider(
        create: (context) => AppBloc(repository: repository),
        child: const HomeView(),
      ),
    );
  }
}
