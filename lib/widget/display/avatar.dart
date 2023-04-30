import 'package:flutter/material.dart';
import 'package:goomba/core/core.dart';

class GbaAvatar extends StatelessWidget {
  final String name;
  final double size;

  const GbaAvatar({
    required this.name,
    this.size = 64,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
        color: context.primaryColor,
        borderRadius: BorderRadius.circular(9999),
      ),
      child: Center(
        child: Text(
          name.substring(0, 1).toUpperCase(),
          style: context.textStyle.bodyMedium?.copyWith(
            fontSize: 32,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
