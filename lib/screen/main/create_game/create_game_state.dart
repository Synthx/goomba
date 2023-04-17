import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goomba/data/data.dart';

part 'create_game_state.freezed.dart';

@freezed
class CreateGameState with _$CreateGameState {
  const factory CreateGameState({
    required bool loading,
    required Character? character,
    required Cup? cup,
    required List<Player> players,
  }) = _CreateGameState;
}
