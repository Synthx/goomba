import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_character.dart';
import 'register_nickname.dart';
import 'register_store.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterStore(
        authStore: context.read(),
      ),
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: false,
          title: const Text('Goomba'),
        ),
        body: Builder(
          builder: (context) {
            return PageView(
              controller: context.read<RegisterStore>().pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                RegisterNicknameStep(),
                RegisterCharacterStep(),
              ],
            );
          },
        ),
      ),
    );
  }
}
