import 'package:flutter_bloc/flutter_bloc.dart';

import 'result_state.dart';

class ResultStore extends Cubit<ResultState> {
  ResultStore()
      : super(const ResultState(
          loading: false,
          players: [],
        ));
}
