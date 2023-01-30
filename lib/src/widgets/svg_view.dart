import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class SvgView extends StatelessWidget {
  final String icon;
  final double? size;
  final Color? color;

  const SvgView(
    this.icon, {
    this.size,
    this.color,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/svg/$icon.svg',
      width: size,
      color: color,
    );
  }
}
