import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goomba/data/data.dart';

part 'choose_player_state.freezed.dart';

@freezed
class ChoosePlayerState with _$ChoosePlayerState {
  const factory ChoosePlayerState({
    required List<Player> selectedPlayers,
    required Pageable<Player> players,
  }) = _ChoosePlayerState;
}
