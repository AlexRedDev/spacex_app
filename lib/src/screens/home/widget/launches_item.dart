import 'package:flutter/material.dart';
import 'package:spacex_app/src/models/launches.dart';

class LaunchesItem extends StatelessWidget {
  const LaunchesItem({Key? key, required this.launches}) : super(key: key);
  final Launches launches;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 20),
      height: height / 2,
      child: Column(
        children: [
          _iconLaunches(launches.urlImage),
          const SizedBox(height: 12),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  launches.missionName,
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.left,
                ),
                const SizedBox(height: 12),
                Text(
                  launches.details ?? '',
                  style: const TextStyle(
                    fontSize: 16,
                    color: Colors.white,
                  ),
                  maxLines: 4,
                  textAlign: TextAlign.left,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _iconLaunches(String? imageUrl) {
    return imageUrl == null
        ? const Placeholder(
            fallbackHeight: 25,
            fallbackWidth: 25,
          )
        : Image.network(
            imageUrl,
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          );
  }
}
