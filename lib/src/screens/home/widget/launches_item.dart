import 'package:flutter/material.dart';
import 'package:spacex_app/src/models/launches.dart';

class LaunchesItem extends StatelessWidget {
  const LaunchesItem({Key? key, required this.launches}) : super(key: key);
  final Launches launches;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20),
      child: Column(
        children: [
          Text(launches.missionName),
          Text(launches.details ?? ''),
        ],
      ),
    );
  }
}
