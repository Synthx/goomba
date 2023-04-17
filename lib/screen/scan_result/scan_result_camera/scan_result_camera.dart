import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'scan_result_camera_preview.dart';
import 'scan_result_camera_state.dart';
import 'scan_result_camera_store.dart';

class ScanResultCamera extends StatelessWidget {
  const ScanResultCamera({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanResultCameraStore(
        scanResultStore: context.read(),
      )..init(),
      child: BlocSelector<ScanResultCameraStore, ScanResultCameraState, int>(
        selector: (state) => state.cameraIndex,
        builder: (context, cameraIndex) {
          if (cameraIndex == -1) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ScanResultCameraPreview(
            cameraIndex: cameraIndex,
          );
        },
      ),
    );
  }
}
