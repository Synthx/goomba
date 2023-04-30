import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/theme/theme.dart';
import 'package:goomba/widget/widget.dart';
import 'package:reactive_forms/reactive_forms.dart';

import 'register_store.dart';

class RegisterNameStep extends StatefulWidget {
  const RegisterNameStep({super.key});

  @override
  State createState() => _RegisterNameStepState();
}

class _RegisterNameStepState extends State<RegisterNameStep> {
  final _nameForm = fb.group({
    'name': ['', Validators.required],
  });

  @override
  void dispose() {
    _nameForm.dispose();
    super.dispose();
  }

  void _goToNextStep() {
    final name = _nameForm.value['name'] as String;
    context.read<RegisterStore>().setName(name);
  }

  @override
  Widget build(BuildContext context) {
    return ReactiveForm(
      formGroup: _nameForm,
      child: Scaffold(
        bottomNavigationBar: BottomAppBar(
          child: ReactiveFormConsumer(
            builder: (context, form, child) {
              return GbaButton.text(
                'Continue',
                onTap: form.invalid ? null : () => _goToNextStep(),
              );
            },
          ),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(kSafeArea),
          physics: const BouncingScrollPhysics(),
          child: Column(
            children: [
              Text(
                'Let\'s get started, what\'s your name?',
                textAlign: TextAlign.center,
                style: context.textStyle.titleMedium?.copyWith(),
              ),
              const Gap(kSpacer),
              const GbaTextField(
                label: 'Your name',
                name: 'name',
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
