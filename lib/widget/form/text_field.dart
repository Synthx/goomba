import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goomba/core/core.dart';
import 'package:reactive_forms/reactive_forms.dart';

class GbaTextField extends StatelessWidget {
  final String label;
  final String name;
  final TextInputAction action;
  final TextInputType type;
  final bool enableSuggestion;
  final VoidCallback? onSubmitted;

  const GbaTextField({
    required this.label,
    required this.name,
    this.action = TextInputAction.next,
    this.type = TextInputType.text,
    this.enableSuggestion = true,
    this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: context.textStyle.bodyMedium?.copyWith(),
        ),
        const Gap(10),
        ReactiveTextField(
          formControlName: name,
          textInputAction: action,
          keyboardType: type,
          enableSuggestions: enableSuggestion,
          onSubmitted: onSubmitted != null ? (_) => onSubmitted!.call() : null,
          decoration: InputDecoration(
            border: const OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 15,
            ),
            hintText: label,
            hintStyle: context.textStyle.bodyMedium?.copyWith(),
          ),
        ),
      ],
    );
  }
}
