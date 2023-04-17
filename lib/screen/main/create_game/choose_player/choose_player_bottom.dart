import 'package:flutter/material.dart';

import 'choose_player_bottom_button.dart';

class ChoosePlayerBottomBar extends StatelessWidget {
  const ChoosePlayerBottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Theme.of(context).cardColor,
        borderRadius: BorderRadius.circular(10),
      ),
      padding: const EdgeInsets.all(10),
      child: Row(
        children: const [
          ChoosePlayerBottomBarButton('Groups'),
          ChoosePlayerBottomBarButton('Friends'),
          ChoosePlayerBottomBarButton('Requests'),
        ],
      ),
    );
  }
}
