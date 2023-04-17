import 'package:flutter/material.dart';

import 'main_app_bar.dart';
import 'main_landing.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      extendBodyBehindAppBar: true,
      appBar: MainAppBar(),
      body: CustomScrollView(
        physics: BouncingScrollPhysics(),
        slivers: [
          MainLanding(),
        ],
      ),
    );
  }
}
