import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:spacex_app/src/modules/history/history_screen.dart';

import 'package:spacex_app/src/modules/launches/launches_screen.dart';
import 'package:spacex_app/src/modules/starships/starship_screen.dart';

import 'app_navigation.dart';

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
        builder: (_, __, child) => AppHome(child: child),
        routes: [
          GoRoute(
            path: '/starship',
            builder: (_, __) => const StarshipScreen(),
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: const StarshipScreen(),
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
            path: '/launches',
            builder: (_, __) => const LaunchesScreen(),
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: const LaunchesScreen(),
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
            path: '/history',
            builder: (_, __) => const HistoryScreen(),
            pageBuilder: (context, state) {
              return CustomTransitionPage(
                child: const HistoryScreen(),
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
