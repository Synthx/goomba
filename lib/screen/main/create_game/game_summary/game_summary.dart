import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:goomba/theme/theme.dart';
import 'package:goomba/widget/widget.dart';

import '../create_game_store.dart';
import 'game_summary_cup.dart';
import 'game_summary_players.dart';

class CreateGameSummary extends StatelessWidget {
  const CreateGameSummary({super.key});

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
        title: const Text('Summary'),
      ),
      bottomNavigationBar: BottomAppBar(
        child: GbaButton.text('Create'),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            GameSummaryCup(),
            Gap(kSpacer),
            GameSummaryPlayers(),
          ],
        ),
      ),
    );
  }
}
