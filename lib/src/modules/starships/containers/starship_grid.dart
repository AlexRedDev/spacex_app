import 'package:flutter/material.dart';
import 'package:spacex_app/src/models/starship.dart';
import 'package:spacex_app/src/modules/starships/widgets/starship_card.dart';

class StarshipGrid extends StatefulWidget {
  final List<Starship>? starships;

  const StarshipGrid(this.starships, {super.key});

  @override
  State<StarshipGrid> createState() => _StarshipGridState();
}

class _StarshipGridState extends State<StarshipGrid> {
  final controller = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  Widget itemBuilder(
    BuildContext context,
    int index,
  ) {
    return StarshipCard(
      widget.starships?[index],
      key: Key(index.hashCode.toString()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      controller: controller,
      itemCount: widget.starships?.length,
      itemBuilder: itemBuilder,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1,
        mainAxisSpacing: 16,
      ),
    );
  }
}
