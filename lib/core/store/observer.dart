import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goomba/core/core.dart';

class CustomBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    logger.d('${bloc.runtimeType} $change');
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    logger.e(bloc.runtimeType, error, stackTrace);
    super.onError(bloc, error, stackTrace);
  }
}