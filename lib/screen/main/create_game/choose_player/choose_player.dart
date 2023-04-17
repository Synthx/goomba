import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'choose_player_bottom.dart';
import 'choose_player_store.dart';

class ChoosePlayerStep extends StatelessWidget {
  const ChoosePlayerStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChoosePlayerStore(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.chevron_left),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text('Joueur(s)'),
        ),
        bottomNavigationBar: const ChoosePlayerBottomBar(),
      ),
    );
  }
}
