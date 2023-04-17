import 'package:flutter/material.dart';

class GbaButton extends StatelessWidget {
  final VoidCallback? onTap;
  final bool? disabled;
  final Widget child;

  const GbaButton({
    required this.child,
    this.disabled = false,
    this.onTap,
    super.key,
  });

  factory GbaButton.text(
    String text, {
    bool? disabled,
    VoidCallback? onTap,
  }) {
    return GbaButton(
      onTap: onTap,
      disabled: disabled,
      child: Text(
        text,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: disabled == true ? null : onTap,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        backgroundColor: const Color(0xFF0E0E0E),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 25,
        ),
      ),
      child: child,
    );
  }
}
