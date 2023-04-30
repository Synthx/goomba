import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:goomba/data/data.dart';

part 'register_state.freezed.dart';

@freezed
class RegisterState with _$RegisterState {
  const factory RegisterState({
    required bool loading,
    required String? name,
    required String? username,
    required Character? character,
  }) = _RegisterState;
}
