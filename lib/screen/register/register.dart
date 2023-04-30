import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'register_character.dart';
import 'register_name.dart';
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
          automaticallyImplyLeading: false,
          title: const Text('Goomba'),
        ),
        body: PageView(
          controller: RegisterStore.pageController,
          physics: const NeverScrollableScrollPhysics(),
          children: const [
            RegisterNameStep(),
            RegisterNicknameStep(),
            RegisterCharacterStep(),
          ],
        ),
      ),
    );
  }
}
