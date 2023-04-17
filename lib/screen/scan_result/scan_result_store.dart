import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:permission_handler/permission_handler.dart';

import 'scan_result_state.dart';

class ScanResultStore extends Cubit<ScanResultState> {
  ScanResultStore()
      : super(const ScanResultState(
          loading: false,
          hasPermission: false,
        ));

  Future init() async {
    emit(state.copyWith(loading: true));
    final status = await Permission.camera.request();
    emit(state.copyWith(
      loading: false,
      hasPermission: status.isGranted,
    ));
  }

  Future openSettings() async {
    await openAppSettings();
  }

  /**
  Future processImage(InputImage image) async {
    final recognizedText = await _textRecognizer.processImage(image);
    final text = recognizedText.text
        .split('\n')
        .map((e) => e.slugify())
        .where((e) => e.isNotEmpty)
        .join(';');
    print(text);
  }
      **/
}
