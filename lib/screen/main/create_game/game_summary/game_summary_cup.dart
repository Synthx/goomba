import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:goomba/data/data.dart';
import 'package:goomba/theme/theme.dart';

import '../create_game_state.dart';
import '../create_game_store.dart';

class GameSummaryCup extends StatelessWidget {
  const GameSummaryCup({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateGameStore, CreateGameState, Cup?>(
      selector: (state) => state.cup,
      builder: (context, cup) {
        if (cup == null) {
          return const SizedBox();
        }

        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
          ),
          child: Row(
            children: [
              Image.asset(
                'assets/images/cups/${cup.id}.png',
                height: 80,
              ),
              const Gap(kSpacer),
              Text(cup.name),
            ],
          ),
        );
      },
    );
  }
}
