import 'package:flutter/material.dart';
import 'package:spacex_app/src/screens/home_view.dart';

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'SpaceX',
      home: HomeView(),
    );
  }
}
