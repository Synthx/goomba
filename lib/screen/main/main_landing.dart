import 'package:flutter/material.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/theme/theme.dart';
import 'package:goomba/widget/widget.dart';

import 'create_game/create_game.dart';

class MainLanding extends StatelessWidget {
  const MainLanding({super.key});

  void _openCreateGame(BuildContext context) {
    Navigator.of(context).push(MaterialPageRoute(
      builder: (context) => const CreateGameDialog(),
      fullscreenDialog: true,
    ));
  }

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      stretch: true,
      automaticallyImplyLeading: false,
      collapsedHeight: 600 + context.topSafeArea,
      expandedHeight: 600 + context.topSafeArea,
      backgroundColor: context.primaryColor,
      flexibleSpace: FlexibleSpaceBar(
        background: Stack(
          fit: StackFit.expand,
          children: [
            Positioned.fill(
              child: Image.asset(
                'assets/images/characters.png',
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                bottom: kSpacer,
                left: kSafeArea,
                right: kSafeArea,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  GbaButton.text(
                    'Create a new game',
                    onTap: () => _openCreateGame(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
