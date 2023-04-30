import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/data/data.dart';
import 'package:goomba/theme/theme.dart';
import 'package:goomba/widget/widget.dart';

import 'choose_player_state.dart';
import 'choose_player_store.dart';

class ChoosePlayerList extends StatelessWidget {
  const ChoosePlayerList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kSafeArea,
          ),
          child: Text(
            'MORE PLAYERS',
            style: context.textStyle.bodyMedium?.copyWith(),
          ),
        ),
        const Gap(kSpacer),
        BlocSelector<ChoosePlayerStore, ChoosePlayerState, List<Player>>(
          selector: (state) => state.players.data,
          builder: (context, players) {
            return ListView.builder(
              shrinkWrap: true,
              itemCount: players.length,
              padding: EdgeInsets.zero,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                final player = players[index];
                return PlayerTile(
                  name: player.name,
                  username: player.username,
                  child: Chip(
                    label: const Text('ADD'),
                    backgroundColor: Theme.of(context).cardColor,
                  ),
                );
              },
            );
          },
        ),
        BlocSelector<ChoosePlayerStore, ChoosePlayerState, bool>(
          selector: (state) => state.players.loading,
          builder: (context, loading) {
            if (loading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return Container();
          },
        ),
      ],
    );
  }
}
