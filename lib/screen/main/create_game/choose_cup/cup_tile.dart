import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/data/data.dart';
import 'package:goomba/theme/theme.dart';

class CupTile extends StatelessWidget {
  final Cup cup;
  final Callback<Cup>? onTap;

  const CupTile({
    required this.cup,
    this.onTap,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap?.call(cup),
      child: Container(
        height: 180,
        padding: const EdgeInsets.symmetric(
          horizontal: kSafeArea,
          vertical: 20,
        ),
        decoration: BoxDecoration(
          color: context.primaryColor,
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Image.asset(
              'assets/images/cups/${cup.id}.png',
              height: 120,
            ),
            const Gap(kSpacer),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text(
                  cup.name,
                  style: context.textStyle.titleMedium?.copyWith(
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
