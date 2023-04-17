import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'screen.dart';

final _rootNavigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  initialLocation: '/',
  navigatorKey: _rootNavigatorKey,
  routes: [
    GoRoute(
      path: '/',
      builder: (context, state) => const Splash(),
      routes: const [],
    ),
  ],
);
