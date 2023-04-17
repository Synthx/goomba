import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goomba/main.dart';

import '../scan_result_store.dart';
import 'scan_result_camera_state.dart';

class ScanResultCameraStore extends Cubit<ScanResultCameraState> {
  final ScanResultStore scanResultStore;

  ScanResultCameraStore({
    required this.scanResultStore,
  }) : super(const ScanResultCameraState(
          cameraIndex: -1,
        ));

  Future init() async {
    if (cameras.isEmpty) {
      return;
    }

    const cameraIndex = 0;
    emit(state.copyWith(
      cameraIndex: cameraIndex,
    ));
  }

  Future processFile(File file) async {}
}
