import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomeScreen extends StatefulWidget {
  final Widget? child;
  const HomeScreen({this.child, super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selected = 0;

  final path = [
    '/starship',
    '/rockets',
    '/launches',
    '/history',
  ];

  void onTap(int index) {
    setState(() => selected = index);
    context.go(path[selected]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: widget.child,
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTap,
        items: const [
          BottomNavigationBarItem(icon: Text('Starship'), label: ''),
          BottomNavigationBarItem(icon: Text('Rockets'), label: ''),
          BottomNavigationBarItem(icon: Text('Launches'), label: ''),
          BottomNavigationBarItem(icon: Text('History'), label: ''),
        ],
      ),
    );
  }
}
