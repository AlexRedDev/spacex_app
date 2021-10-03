import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:spacex_app/src/models/launches.dart';

class DetailsView extends StatelessWidget {
  const DetailsView({Key? key, required this.launches}) : super(key: key);
  final Launches launches;
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: Text(
          launches.missionName,
          style: Theme.of(context).textTheme.headline1,
        ),
      ),
      body: _details(context, height),
    );
  }

  Widget _details(BuildContext context, double height) {
    if (launches.details == null) {
      return Container(
        child: _picture(
          launches.urlImage.isNotEmpty ? launches.urlImage : null,
          height,
        ),
      );
    } else {
      return ListView(
        children: [
          _picture(
            launches.urlImage.isNotEmpty ? launches.urlImage : null,
            height / 2,
          ),
          const SizedBox(height: 22),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12.0),
            child: Text(
              launches.details ?? '',
              style: Theme.of(context).textTheme.bodyText1,
              textAlign: TextAlign.justify,
            ),
          )
        ],
      );
    }
  }

  Widget _picture(List<String>? urlImages, double height) {
    return urlImages == null
        ? Container()
        : CarouselSlider.builder(
            itemCount: urlImages.length,
            itemBuilder: (context, itemIndex, pageViewIndex) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  urlImages[itemIndex],
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
                ),
              );
            },
            options: CarouselOptions(
              viewportFraction: 1,
              height: height,
            ),
          );
  }
}
