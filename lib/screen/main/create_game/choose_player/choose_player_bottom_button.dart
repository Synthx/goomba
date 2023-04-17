import 'package:flutter/material.dart';

class ChoosePlayerBottomBarButton extends StatelessWidget {
  final String value;
  final bool? selected;
  final VoidCallback? onTap;

  const ChoosePlayerBottomBarButton(
    this.value, {
    this.selected,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {},
      style: ElevatedButton.styleFrom(
        backgroundColor: selected == true ? Colors.green : Colors.grey,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(value),
    );
  }
}
