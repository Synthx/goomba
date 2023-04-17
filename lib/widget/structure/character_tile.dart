import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/data/data.dart';

class CharacterTile extends StatelessWidget {
  final Character character;
  final bool? selected;
  final Callback<Character>? onTap;

  const CharacterTile({
    required this.character,
    this.selected,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(character),
      child: Container(
        decoration: BoxDecoration(
          color: Theme.of(context).scaffoldBackgroundColor,
          borderRadius: BorderRadius.circular(10),
          boxShadow: const [
            BoxShadow(
              offset: Offset(1, 1),
              spreadRadius: -4,
              blurRadius: 10,
              color: Color.fromRGBO(86, 86, 86, 0.55),
            ),
          ],
        ),
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              decoration: BoxDecoration(
                color: context.primaryColor,
                borderRadius: BorderRadius.circular(100),
              ),
              padding: const EdgeInsets.all(8),
              child: Image.asset(
                'assets/images/characters/${character.id}.png',
                width: 90,
                height: 90,
              ),
            ),
            const Gap(10),
            Text(
              character.name,
              textAlign: TextAlign.center,
              style: context.textStyle.bodyMedium?.copyWith(),
            ),
          ],
        ),
      ),
    );
  }
}
