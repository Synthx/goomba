import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/data/data.dart';
import 'package:goomba/store/store.dart';
import 'package:goomba/theme/theme.dart';
import 'package:goomba/widget/widget.dart';

import '../create_game_store.dart';

class ChooseCharacterStep extends StatelessWidget {
  const ChooseCharacterStep({super.key});

  void _selectCharacter(BuildContext context, Character character) {
    context.read<CreateGameStore>().setCharacter(character);
  }

  void _goToPreviousStep(BuildContext context) {
    context.read<CreateGameStore>().goToPreviousStep();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: () => _goToPreviousStep(context),
        ),
        title: const Text('Character'),
      ),
      body: BlocSelector<AttributeStore, AttributeState, List<Character>>(
        selector: (state) => state.characters,
        builder: (context, characters) {
          return GridView.builder(
            itemCount: characters.length,
            gridDelegate: kGridDelegate,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              left: kSafeArea,
              right: kSafeArea,
              top: kSafeArea,
              bottom: kSafeArea + context.bottomSafeArea,
            ),
            itemBuilder: (context, index) {
              return CharacterTile(
                character: characters[index],
                onTap: (e) => _selectCharacter(context, e),
              );
            },
          );
        },
      ),
    );
  }
}
