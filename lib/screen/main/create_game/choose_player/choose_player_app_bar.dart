import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../create_game_store.dart';

class ChoosePlayerAppBar extends StatelessWidget with PreferredSizeWidget {
  const ChoosePlayerAppBar({super.key});

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  void _goToPreviousStep(BuildContext context) {
    context.read<CreateGameStore>().goToPreviousStep();
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: IconButton(
        icon: const Icon(Icons.chevron_left),
        onPressed: () => _goToPreviousStep(context),
      ),
      title: const Text('Players'),
    );
  }
}
