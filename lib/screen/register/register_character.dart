import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/data/data.dart';
import 'package:goomba/store/store.dart';
import 'package:goomba/theme/theme.dart';
import 'package:goomba/widget/widget.dart';

import 'register_state.dart';
import 'register_store.dart';

class RegisterCharacterStep extends StatelessWidget {
  const RegisterCharacterStep({super.key});

  void _selectCharacter(BuildContext context, Character character) {
    context.read<RegisterStore>().setCharacter(character);
  }

  void _register(BuildContext context) {
    context.read<RegisterStore>().register();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      bottomNavigationBar:
          BlocSelector<RegisterStore, RegisterState, Character?>(
        selector: (state) => state.character,
        builder: (context, character) {
          if (character == null) {
            return Container();
          }

          return BottomAppBar(
            color: Colors.transparent,
            child: GbaButton.text(
              'Continue',
              onTap: () => _register(context),
            ),
          );
        },
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(kSafeArea),
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            Text(
              'Next, choose your main character',
              style: context.textStyle.titleMedium?.copyWith(),
            ),
            const Gap(kSpacer),
            BlocSelector<RegisterStore, RegisterState, Character?>(
              selector: (state) => state.character,
              builder: (context, selectedCharacter) {
                return BlocSelector<AttributeStore, AttributeState,
                    List<Character>>(
                  selector: (state) => state.characters,
                  builder: (context, characters) {
                    return GridView.builder(
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      gridDelegate: kGridDelegate,
                      itemCount: characters.length,
                      itemBuilder: (context, index) {
                        final character = characters[index];
                        return CharacterTile(
                          character: character,
                          selected: character.id == selectedCharacter?.id,
                          onTap: (e) => _selectCharacter(context, e),
                        );
                      },
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
