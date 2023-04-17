import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChoosePlayerStore extends Cubit<bool> {
  final pageController = PageController();

  ChoosePlayerStore() : super(false);

  @override
  Future<void> close() {
    pageController.dispose();
    return super.close();
  }
}
