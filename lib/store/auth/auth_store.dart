import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goomba/data/data.dart';

import 'auth_state.dart';

class AuthStore extends Cubit<AuthState> {
  final AuthService authService;

  AuthStore({
    required this.authService,
  }) : super(const AuthState(
          player: null,
        ));

  Future init() async {
    final player = await authService.load();
    emit(state.copyWith(
      player: player,
    ));
  }

  Future register({
    required String nickname,
    required Character character,
  }) async {
    final player = await authService.register(
      nickname: nickname,
      character: character,
    );
    emit(state.copyWith(
      player: player,
    ));
  }
}
