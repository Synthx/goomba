import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/theme/theme.dart';
import 'package:goomba/widget/widget.dart';

class GbaBottomSheet extends StatelessWidget {
  final String? title;
  final Widget child;

  const GbaBottomSheet({
    required this.child,
    this.title,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: 30,
        left: kSafeArea,
        right: kSafeArea,
        bottom: kSafeArea + context.bottomSafeArea,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).scaffoldBackgroundColor,
        borderRadius: const BorderRadius.vertical(
          top: Radius.circular(30),
        ),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          IconButton(
            padding: EdgeInsets.zero,
            constraints: const BoxConstraints(),
            icon: const GbaIcon(GbaIconData.close, size: 32),
            onPressed: () => Navigator.of(context).pop(),
          ),
          const Gap(10),
          if (title != null)
            Padding(
              padding: const EdgeInsets.only(
                bottom: kSpacer,
              ),
              child: Text(
                title!,
                style: context.textStyle.titleMedium?.copyWith(),
              ),
            ),
          child,
        ],
      ),
    );
  }
}
