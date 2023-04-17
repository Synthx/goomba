import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goomba/data/data.dart';

part 'game.freezed.dart';

@freezed
class Game with _$Game {
  const factory Game({
    required String id,
    required String name,
    required Cup cup,
  }) = _Game;
}
