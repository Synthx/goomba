import 'package:freezed_annotation/freezed_annotation.dart';

part 'result_state.freezed.dart';

@freezed
class ResultState with _$ResultState {
  const factory ResultState({
    required bool loading,
    required List<dynamic> players,
  }) = _ResultState;
}
