import 'package:freezed_annotation/freezed_annotation.dart';

part 'scan_result_camera_state.freezed.dart';

@freezed
class ScanResultCameraState with _$ScanResultCameraState {
  const factory ScanResultCameraState({
    required int cameraIndex,
  }) = _ScanResultCameraState;
}
