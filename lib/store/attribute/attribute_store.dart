import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goomba/core/core.dart';
import 'package:goomba/data/data.dart';

import 'attribute_state.dart';

class AttributeStore extends Cubit<AttributeState> {
  AttributeStore()
      : super(const AttributeState(
          characters: [],
          cups: [],
        ));

  Future init() async {
    // todo: need destructuring assignment (dart3)
    final cups = await _loadData('cups', Cup.fromJson);
    final characters = await _loadData('characters', Character.fromJson);

    emit(state.copyWith(
      characters: characters,
      cups: cups,
    ));
  }

  Future<List<T>> _loadData<T>(
    String path,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final response = await http.get(
      'api/data/$path',
      options: Options(
        headers: {'no-auth': true},
      ),
    );

    final data = response.data as List<dynamic>;
    return data.map((e) => fromJson(e)).toList();
  }
}
