import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/data/data.dart';
import 'package:goomba/screen/screen.dart';
import 'package:goomba/store/store.dart';
import 'package:goomba/theme/theme.dart';

import 'splash_store.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SplashStore(
        attributeStore: context.read(),
        authStore: context.read(),
      )..init(),
      child: BlocSelector<SplashStore, bool, bool>(
        selector: (state) => state,
        builder: (context, loading) {
          if (loading) {
            return const SplashScreen();
          }

          return BlocSelector<AuthStore, AuthState, Player?>(
            selector: (state) => state.player,
            builder: (context, player) {
              if (player == null) {
                return const RegisterScreen();
              }

              return const MainScreen();
            },
          );
        },
      ),
    );
  }
}

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      backgroundColor: Theme.of(context).primaryColor,
      body: Padding(
        padding: EdgeInsets.only(
          left: kSafeArea,
          right: kSafeArea,
          top: kSafeArea + context.topSafeArea,
          bottom: kSafeArea + context.bottomSafeArea,
        ),
        child: SizedBox(
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/logo.webp',
                width: 200,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
