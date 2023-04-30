import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:goomba/core/core.dart';
import 'package:reactive_forms/reactive_forms.dart';

class GbaTextField extends StatelessWidget {
  final String label;
  final String name;
  final TextInputAction action;
  final TextInputType type;
  final bool autocorrect;
  final bool enableSuggestion;
  final VoidCallback? onSubmitted;

  const GbaTextField({
    required this.label,
    required this.name,
    this.action = TextInputAction.next,
    this.type = TextInputType.text,
    this.autocorrect = true,
    this.enableSuggestion = true,
    this.onSubmitted,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ReactiveTextField(
      formControlName: name,
      textInputAction: action,
      keyboardType: type,
      autocorrect: autocorrect,
      enableSuggestions: enableSuggestion,
      onSubmitted: onSubmitted != null ? (_) => onSubmitted!.call() : null,
      decoration: InputDecoration(
        border: InputBorder.none,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 15,
          vertical: 15,
        ),
        hintText: label,
        hintStyle: context.textStyle.titleLarge?.copyWith(
          color: context.textStyle.bodyMedium?.color,
        ),
      ),
    );
  }
}
