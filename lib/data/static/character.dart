import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/data/data.dart';

part 'character.freezed.dart';

part 'character.g.dart';

@freezed
class Character with _$Character {
  const Character._();

  const factory Character({
    required int id,
    required String name,
    required String color,
    required CharacterCategory category,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);

  String slug() {
    return name.slugify();
  }
}
