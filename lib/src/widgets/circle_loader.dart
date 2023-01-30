import 'package:flutter/material.dart';

class CirclerLoader extends StatelessWidget {
  final double size;
  const CirclerLoader({this.size = 100, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size,
      height: size,
      child: const CircularProgressIndicator(),
    );
  }
}
