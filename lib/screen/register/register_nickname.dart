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
    'nickname': ['', Validators.required],
  });

  @override
  void dispose() {
    _nicknameForm.dispose();
    super.dispose();
  }

  void _goToNextStep() {
    final nickname = _nicknameForm.value['nickname'] as String;
    context.read<RegisterStore>().setNickname(nickname);
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: _nicknameForm,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          elevation: 0,
          child: Column(
            children: [
              Text(
                'Your username is unique\nand will be visible to everyone',
                textAlign: TextAlign.center,
                style: context.textStyle.bodyMedium?.copyWith(),
              ),
              const Gap(5),
              ReactiveFormConsumer(
                builder: (context, form, child) {
                  return GbaButton.text(
                    'Next',
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
                'Let\'s get started, create your username',
                style: context.textStyle.titleMedium?.copyWith(),
              ),
              const Gap(kSpacer),
              const GbaTextField(
                label: 'Your username',
                name: 'nickname',
                enableSuggestion: false,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
