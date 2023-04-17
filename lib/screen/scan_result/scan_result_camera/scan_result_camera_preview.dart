import 'dart:io';

import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/main.dart';
import 'package:goomba/theme/theme.dart';

import 'scan_result_camera_store.dart';

class ScanResultCameraPreview extends StatefulWidget {
  final int cameraIndex;

  const ScanResultCameraPreview({
    required this.cameraIndex,
    super.key,
  });

  @override
  State createState() => _ScanResultCameraPreviewState();
}

class _ScanResultCameraPreviewState extends State<ScanResultCameraPreview>
    with WidgetsBindingObserver {
  CameraController? _controller;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _startLiveFeed();
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _stopLiveFeed();
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (_controller == null || _controller?.value.isInitialized != true) {
      return;
    }

    if (state == AppLifecycleState.resumed) {
      _startLiveFeed();
    } else {
      _stopLiveFeed();
    }
  }

  Future _startLiveFeed() async {
    _controller = CameraController(
      cameras[widget.cameraIndex],
      ResolutionPreset.high,
      enableAudio: false,
    );

    await _controller!.initialize();
    if (!mounted) {
      return;
    }

    // _controller!.startImageStream((image) => context.read<ScanResultCameraStore>().processImage(image));
    setState(() {});
  }

  Future _stopLiveFeed() async {
    // await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
  }

  Future _takePicture(ScanResultCameraStore store) async {
    final image = await _controller?.takePicture();
    if (image == null) {
      return;
    }

    final file = File(image.path);
    store.processFile(file);
  }

  @override
  Widget build(BuildContext context) {
    if (_controller == null || _controller?.value.isInitialized != true) {
      return const Placeholder();
    }

    final size = MediaQuery.of(context).size;
    var scale = size.aspectRatio * _controller!.value.aspectRatio;
    if (scale < 1) {
      scale = 1 / scale;
    }

    return Stack(
      children: [
        Transform.scale(
          scale: scale,
          child: Center(
            child: CameraPreview(
              _controller!,
            ),
          ),
        ),
        Positioned(
          left: kSafeArea,
          right: kSafeArea,
          bottom: kSafeArea + context.bottomSafeArea,
          child: Column(
            children: [
              TextButton(
                onPressed: () => _takePicture(context.read()),
                child: const Text('take picture'),
              ),
              const Gap(kSpacer),
              Text(
                'Make sure to capture the entire result screen',
                textAlign: TextAlign.center,
                style: context.textStyle.bodyMedium?.copyWith(
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
