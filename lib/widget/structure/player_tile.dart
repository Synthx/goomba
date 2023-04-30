import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/theme/theme.dart';
import 'package:goomba/widget/widget.dart';

class PlayerTile extends StatelessWidget {
  final String name;
  final String username;
  final VoidCallback? onTap;
  final Widget? child;

  const PlayerTile({
    required this.name,
    required this.username,
    this.onTap,
    this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () => onTap?.call(),
      contentPadding: const EdgeInsets.symmetric(
        horizontal: kSafeArea,
      ),
      title: Row(
        children: [
          GbaAvatar(
            name: name,
          ),
          const Gap(kSpacer),
          Column(
            children: [
              Text(
                name,
                style: context.textStyle.bodyMedium?.copyWith(),
              ),
              Text(
                username,
                style: context.textStyle.bodyMedium?.copyWith(),
              ),
            ],
          ),
          const Spacer(),
          child ?? Container(),
        ],
      ),
    );
  }
}
