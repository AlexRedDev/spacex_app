import 'package:flutter/material.dart';
import 'package:spacex_app/src/app/app_theme.dart';

import 'app/router.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.data,
      routerConfig: AppRouter.router,
    );
  }
}
