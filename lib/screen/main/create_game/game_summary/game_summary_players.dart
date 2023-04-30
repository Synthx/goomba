import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:goomba/data/data.dart';
import 'package:goomba/theme/theme.dart';

import '../create_game_state.dart';
import '../create_game_store.dart';

class GameSummaryPlayers extends StatelessWidget {
  const GameSummaryPlayers({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<CreateGameStore, CreateGameState, List<Player>>(
      selector: (state) => state.players,
      builder: (context, players) {
        return ListView.builder(
          shrinkWrap: true,
          itemCount: players.length,
          physics: const NeverScrollableScrollPhysics(),
          itemBuilder: (context, index) {
            final player = players[index];
            return ListTile(
              contentPadding: const EdgeInsets.symmetric(
                horizontal: kSafeArea,
                vertical: 15,
              ),
              tileColor: Theme.of(context).primaryColor,
              title: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Image.asset(
                    'assets/images/characters/${player.character.id}.png',
                    height: 120,
                  ),
                  const Gap(kSpacer),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text(player.name),
                      Text(player.character.name),
                      const Gap(10),
                    ],
                  ),
                  const Spacer(),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
