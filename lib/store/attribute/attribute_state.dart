import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goomba/data/data.dart';

part 'attribute_state.freezed.dart';

@freezed
class AttributeState with _$AttributeState {
  const factory AttributeState({
    required List<Character> characters,
    required List<Course> courses,
    required List<Cup> cups,
  }) = _AttributeState;
}
