import 'package:flutter/material.dart';
import 'package:spacex_app/src/models/launches.dart';
import 'package:spacex_app/src/screens/detail/details_view.dart';

class LaunchesItem extends StatelessWidget {
  const LaunchesItem({Key? key, required this.launches}) : super(key: key);
  final Launches launches;

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () => Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => DetailsView(launches: launches))),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20),
        height: height / 2,
        child: Column(
          children: [
            _iconLaunches(
                launches.urlImage.isNotEmpty ? launches.urlImage.first : null),
            const SizedBox(height: 12),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    launches.missionName,
                    style: Theme.of(context).textTheme.headline1,
                    textAlign: TextAlign.left,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    launches.details ?? '',
                    style: Theme.of(context).textTheme.bodyText1,
                    maxLines: 4,
                    textAlign: TextAlign.left,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _iconLaunches(String? imageUrl) {
    return imageUrl == null
        ? Container(
            height: 300,
          )
        : Image.network(
            imageUrl,
            loadingBuilder: (context, child, loadingProgress) {
              if (loadingProgress == null) {
                return child;
              } else {
                return Center(
                  child: CircularProgressIndicator(
                    color: Theme.of(context).primaryColor,
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded /
                            loadingProgress.expectedTotalBytes!
                        : null,
                  ),
                );
              }
            },
            fit: BoxFit.cover,
            height: 300,
            width: double.infinity,
          );
  }
}
