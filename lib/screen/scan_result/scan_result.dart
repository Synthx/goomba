import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'scan_result_camera/scan_result_camera.dart';
import 'scan_result_state.dart';
import 'scan_result_store.dart';

class ScanResultScreen extends StatelessWidget {
  const ScanResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ScanResultStore()..init(),
      child: BlocBuilder<ScanResultStore, ScanResultState>(
        builder: (context, state) {
          if (state.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          if (!state.hasPermission) {
            return Center(
              child: ElevatedButton(
                onPressed: () => context.read<ScanResultStore>().openSettings(),
                child: const Text('Open Settings'),
              ),
            );
          }

          return const ScanResultCamera();
        },
      ),
    );
  }
}
