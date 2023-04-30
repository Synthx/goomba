import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goomba/widget/widget.dart';

import 'choose_player_store.dart';

class ChoosePlayerBottomBar extends StatelessWidget {
  const ChoosePlayerBottomBar({super.key});

  void _save(BuildContext context) {
    context.read<ChoosePlayerStore>().save();
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: GbaButton.text(
        'Continue',
        onTap: () => _save(context),
      ),
    );
  }
}
