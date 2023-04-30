import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/theme/theme.dart';

import 'choose_player_app_bar.dart';
import 'choose_player_bottom_bar.dart';
import 'choose_player_list.dart';
import 'choose_player_selected.dart';
import 'choose_player_store.dart';

class ChoosePlayerStep extends StatelessWidget {
  const ChoosePlayerStep({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChoosePlayerStore(
        authStore: context.read(),
        createGameStore: context.read(),
        playerService: getIt(),
      )..init(),
      child: Scaffold(
        appBar: const ChoosePlayerAppBar(),
        bottomNavigationBar: const ChoosePlayerBottomBar(),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(
            top: kSpacer,
          ),
          child: Column(
            children: const [
              ChoosePlayerSelected(),
              Gap(kSpacer),
              ChoosePlayerList(),
            ],
          ),
        ),
      ),
    );
  }
}
