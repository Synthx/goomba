import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goomba/data/data.dart';

part 'player.freezed.dart';

part 'player.g.dart';

@freezed
class Player with _$Player {
  const factory Player({
    required String id,
    required String name,
    required String username,
    required Character character,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);
}
