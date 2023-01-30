import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:spacex_app/src/models/starship.dart';

class StarshipCard extends StatelessWidget {
  final Starship? starship;

  const StarshipCard(
    this.starship, {
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              'assets/svg/starship.svg',
              width: 50,
              color: Theme.of(context).primaryColor.withOpacity(0.5),
            ),
            const SizedBox(height: 12),
            Text(
              '${starship?.name}',
              style: Theme.of(context)
                  .textTheme
                  .titleMedium
                  ?.copyWith(fontWeight: FontWeight.w700),
            ),
            Text(
              'Type: ${starship?.type}',
              style: Theme.of(context).textTheme.titleSmall,
            ),
          ],
        ),
      ),
    );
  }
}
