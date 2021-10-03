import 'package:flutter/material.dart';
import 'package:spacex_app/src/models/launches.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key, required this.launches}) : super(key: key);
  final Launches launches;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          launches.missionName,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: ListView(
        children: [
          _picture(launches.urlImage),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              launches.details ?? '',
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.justify,
            ),
          )
        ],
      ),
    );
  }

  Widget _picture(String? url) {
    if (url != null) {
      return Image.network(url);
    } else {
      return Placeholder(
        fallbackHeight: 300,
        fallbackWidth: double.infinity,
      );
    }
  }
}
