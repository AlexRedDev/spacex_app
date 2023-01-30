import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AppHome extends StatefulWidget {
  final Widget? child;
  const AppHome({this.child, super.key});

  @override
  State<AppHome> createState() => _AppHomeState();
}

class _AppHomeState extends State<AppHome> {
  int selected = 0;

  final path = [
    '/starship',
    '/launches',
    '/history',
  ];

  void onTap(int index) {
    context.go(path[selected]);
    setState(() => selected = index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        currentIndex: selected,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.rocket_launch_rounded),
            label: 'Starship',
          ),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.launch,
                size: 24,
              ),
              label: 'Launches'),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.history_toggle_off_outlined,
              size: 24,
            ),
            label: 'History',
          ),
        ],
      ),
    );
  }
}
