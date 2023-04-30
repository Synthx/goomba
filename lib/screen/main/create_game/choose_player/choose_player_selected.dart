import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/data/data.dart';
import 'package:goomba/theme/theme.dart';
import 'package:goomba/widget/widget.dart';

import 'choose_player_state.dart';
import 'choose_player_store.dart';

class ChoosePlayerSelected extends StatelessWidget {
  const ChoosePlayerSelected({super.key});

  void _removePlayer(BuildContext context, Player player) {
    context.read<ChoosePlayerStore>().removePlayer(player);
  }

  @override
  Widget build(BuildContext context) {
    return BlocSelector<ChoosePlayerStore, ChoosePlayerState, List<Player>>(
      selector: (state) => state.selectedPlayers,
      builder: (context, players) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: kSafeArea,
              ),
              child: Text(
                'PLAYERS (${players.length})',
                style: context.textStyle.bodyMedium?.copyWith(),
              ),
            ),
            const Gap(kSpacer),
            ListView.builder(
              shrinkWrap: true,
              itemCount: players.length,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final player = players[index];
                return PlayerTile(
                  name: player.name,
                  username: player.username,
                  child: IconButton(
                    icon: const Icon(Icons.clear),
                    onPressed: () => _removePlayer(context, player),
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
