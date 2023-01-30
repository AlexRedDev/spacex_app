import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'package:spacex_app/src/modules/home/home_screen.dart';
import 'package:spacex_app/src/modules/rockets/rockets_screen.dart';
import 'package:spacex_app/src/modules/starships/starship_screen.dart';

class AppRouter {
  static final _rootNavigatorKey = GlobalKey<NavigatorState>();
  static final _shellNavigatorKey = GlobalKey<NavigatorState>();
  //TOD:
  static final router = GoRouter(
    initialLocation: '/starship',
    navigatorKey: _rootNavigatorKey,
    routes: [
      ShellRoute(
        navigatorKey: _shellNavigatorKey,
        builder: (_, __, child) => HomeScreen(child: child),
        routes: [
          GoRoute(
            path: '/starship',
            builder: (_, __) => const StarshipScreen(),
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: StarshipScreen(),
                key: state.pageKey,
                transitionsBuilder:
                    (context, firstAnimation, secondAnimation, widget) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCubic)
                        .animate(firstAnimation),
                    child: widget,
                  );
                },
              );
            },
          ),
          GoRoute(
            path: '/rockets',
            builder: (_, __) => const RocketsScreen(),
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: RocketsScreen(),
                key: state.pageKey,
                transitionsBuilder:
                    (context, firstAnimation, secondAnimation, widget) {
                  return FadeTransition(
                    opacity: CurveTween(curve: Curves.easeInOutCubic)
                        .animate(firstAnimation),
                    child: widget,
                  );
                },
              );
            },
          )
        ],
      )
    ],
  );
}
