import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/data/data.dart';
import 'package:goomba/store/store.dart';
import 'package:goomba/theme/theme.dart';

import '../create_game_store.dart';
import 'cup_tile.dart';

class ChooseCupStep extends StatelessWidget {
  const ChooseCupStep({super.key});

  void _selectCup(BuildContext context, Cup cup) {
    context.read<CreateGameStore>().setCup(cup);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.clear),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Cup'),
      ),
      body: BlocSelector<AttributeStore, AttributeState, List<Cup>>(
        selector: (state) => state.cups,
        builder: (context, cups) {
          return ListView.separated(
            itemCount: cups.length,
            physics: const BouncingScrollPhysics(),
            padding: EdgeInsets.only(
              bottom: kSafeArea + context.bottomSafeArea,
            ),
            separatorBuilder: (context, index) => const Gap(5),
            itemBuilder: (context, index) {
              return CupTile(
                cup: cups[index],
                onTap: (e) => _selectCup(context, e),
              );
            },
          );
        },
      ),
    );
  }
}
