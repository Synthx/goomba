import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'choose_character/choose_character.dart';
import 'choose_cup/choose_cup.dart';
import 'choose_player/choose_player.dart';
import 'create_game_store.dart';

class CreateGameDialog extends StatelessWidget {
  const CreateGameDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateGameStore(),
      child: Scaffold(
        body: PageView(
          controller: CreateGameStore.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            ChooseCupStep(),
            ChooseCharacterStep(),
            ChoosePlayerStep(),
          ],
        ),
      ),
    );
  }
}
