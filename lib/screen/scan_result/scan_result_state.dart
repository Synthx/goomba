import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_result_state.freezed.dart';

@freezed
class ScanResultState with _$ScanResultState {
  const factory ScanResultState({
    required bool loading,
    required bool hasPermission,
  }) = _ScanResultState;
}
