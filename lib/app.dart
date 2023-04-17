import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/screen/router.dart';
import 'package:goomba/store/store.dart';
import 'package:goomba/theme/theme.dart';

class Goomba extends StatelessWidget {
  const Goomba({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => AttributeStore()),
        BlocProvider(
          create: (context) => AuthStore(
            authService: getIt(),
          ),
        ),
      ],
      child: MaterialApp.router(
        title: 'Goomba',
        debugShowCheckedModeBanner: false,
        debugShowMaterialGrid: false,
        theme: lightThemeData,
        themeMode: ThemeMode.light,
        routerConfig: router,
      ),
    );
  }
}
