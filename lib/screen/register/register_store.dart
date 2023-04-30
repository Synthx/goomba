import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goomba/data/data.dart';
import 'package:goomba/store/store.dart';

import 'register_state.dart';

class RegisterStore extends Cubit<RegisterState> {
  static final pageController = PageController();

  final AuthStore authStore;

  RegisterStore({
    required this.authStore,
  }) : super(const RegisterState(
          loading: false,
          name: null,
          username: null,
          character: null,
        ));

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  Future setName(String name) async {
    emit(state.copyWith(name: name));
    await pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future setUsername(String username) async {
    emit(state.copyWith(username: username));
    await pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future setCharacter(Character character) async {
    emit(state.copyWith(character: character));
  }

  Future register() async {
    emit(state.copyWith(loading: true));
    await authStore.register(
      name: state.name!,
      username: state.username!,
      character: state.character!,
    );
    emit(state.copyWith(loading: false));
  }
}
