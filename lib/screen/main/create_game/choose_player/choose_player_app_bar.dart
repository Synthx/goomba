import 'package:flutter/material.dart';

class ChoosePlayerAppBar extends StatelessWidget with PreferredSizeWidget {
  const ChoosePlayerAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text('Joueur(s)'),
    );
  }
}
