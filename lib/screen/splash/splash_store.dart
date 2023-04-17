import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goomba/store/store.dart';

class SplashStore extends Cubit<bool> {
  final AttributeStore attributeStore;
  final AuthStore authStore;

  SplashStore({
    required this.attributeStore,
    required this.authStore,
  }) : super(true);

  Future init() async {
    await Future.wait([
      attributeStore.init(),
      authStore.init(),
      Future.delayed(const Duration(seconds: 1)),
    ]);

    emit(false);
  }
}
