import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goomba/data/data.dart';

import 'create_game_state.dart';

class CreateGameStore extends Cubit<CreateGameState> {
  static final pageController = PageController();

  CreateGameStore()
      : super(const CreateGameState(
          loading: false,
          character: null,
          cup: null,
          players: [],
        ));

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }

  Future setCharacter(Character character) async {
    emit(state.copyWith(character: character));
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future setCup(Cup cup) async {
    emit(state.copyWith(cup: cup));
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future setPlayers(List<Player> players) async {
    emit(state.copyWith(players: players));
    pageController.nextPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future goToPreviousStep() async {
    pageController.previousPage(
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  Future save() async {
    emit(state.copyWith(loading: true));
    await Future.delayed(const Duration(seconds: 1));
  }
}
