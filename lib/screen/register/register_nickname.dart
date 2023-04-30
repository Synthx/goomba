import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/theme/theme.dart';
import 'package:goomba/widget/widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'register_store.dart';

class RegisterNicknameStep extends StatefulWidget {
  const RegisterNicknameStep({super.key});

  @override
  State createState() => _RegisterNicknameStepState();
}

class _RegisterNicknameStepState extends State<RegisterNicknameStep> {
  final _nicknameForm = fb.group({
    'username': ['', Validators.required],
  });

  @override
  void dispose() {
    _nicknameForm.dispose();
    super.dispose();
  }

  void _goToNextStep() {
    final username = _nicknameForm.value['username'] as String;
    context.read<RegisterStore>().setUsername(username);
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: _nicknameForm,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                'Your username is unique\nand will be visible to everyone',
                textAlign: TextAlign.center,
                style: context.textStyle.bodyMedium?.copyWith(),
              ),
              const Gap(kSpacer),
              ReactiveFormConsumer(
                builder: (context, form, child) {
                  return GbaButton.text(
                    'Continue',
                    onTap: form.invalid ? null : () => _goToNextStep(),
                  );
                },
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(kSafeArea),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                'Next, create your username',
                textAlign: TextAlign.center,
                style: context.textStyle.titleMedium?.copyWith(),
              ),
              const Gap(kSpacer),
              const GbaTextField(
                label: 'Your username',
                name: 'username',
                autocorrect: false,
                enableSuggestion: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
