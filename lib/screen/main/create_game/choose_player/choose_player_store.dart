import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goomba/data/data.dart';
import 'package:goomba/store/store.dart';

import '../create_game_store.dart';
import 'choose_player_state.dart';

class ChoosePlayerStore extends Cubit<ChoosePlayerState> {
  final AuthStore authStore;
  final CreateGameStore createGameStore;
  final PlayerService playerService;

  ChoosePlayerStore({
    required this.authStore,
    required this.createGameStore,
    required this.playerService,
  }) : super(const ChoosePlayerState(
          selectedPlayers: [],
          players: Pageable(),
        ));

  Future init() async {
    final player = authStore.state.player!;
    emit(state.copyWith(
      selectedPlayers: [player],
      players: state.players.copyWith(
        loading: true,
      ),
    ));

    final players = await playerService.findAll();
    emit(state.copyWith.players(
      loading: false,
      data: players.content,
      total: players.totalElements,
    ));
  }

  Future addPlayer(Player player) async {
    emit(state.copyWith(
      selectedPlayers: [...state.selectedPlayers, player],
    ));
  }

  Future removePlayer(Player player) async {
    emit(state.copyWith(
      selectedPlayers:
          state.selectedPlayers.where((e) => e.id != player.id).toList(),
    ));
  }

  Future save() async {
    final players = state.selectedPlayers;
    createGameStore.setPlayers(players);
  }
}
