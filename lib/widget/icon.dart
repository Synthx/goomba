import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

enum GbaIconData {
  close,
  gamepad,
  home,
  menu,
  search,
}

class GbaIcon extends StatelessWidget {
  final GbaIconData name;
  final Color? color;
  final double? size;

  const GbaIcon(
    this.name, {
    this.color,
    this.size,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/icons/$name.svg',
      height: size ?? 24,
      width: size ?? 24,
    );
  }
}
