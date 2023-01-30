import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:spacex_app/src/modules/starships/containers/starship_grid.dart';
import 'package:spacex_app/src/modules/starships/starship_cubit.dart';
import 'package:spacex_app/src/widgets/circle_loader.dart';

import 'widgets/starship_card.dart';

class StarshipScreen extends StatelessWidget {
  const StarshipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      lazy: false,
      create: (_) => StarshipCubit(),
      child: BlocBuilder<StarshipCubit, StarshipState>(
        builder: (BuildContext context, StarshipState state) {
          switch (state.status) {
            case Progress.initial:
            case Progress.loading:
              return const CirclerLoader();
            case Progress.loaded:
              return Padding(
                padding: const EdgeInsets.all(16.0),
                child: StarshipGrid(state.starships),
              );
            case Progress.error:
              return const Center(child: Text('Some error'));
          }
        },
      ),
    );
  }
}
