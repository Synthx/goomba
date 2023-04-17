import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goomba/data/data.dart';

import 'attribute_state.dart';

class AttributeStore extends Cubit<AttributeState> {
  AttributeStore()
      : super(const AttributeState(
          characters: [],
          courses: [],
          cups: [],
        ));

  Future init() async {
    // todo: need destructuring assignment (dart3)
    final cups = await _loadData('cups', Cup.fromJson);
    final courses = await _loadData('courses', Course.fromJson);
    final characters = await _loadData('characters', Character.fromJson);

    emit(state.copyWith(
      characters: characters,
      courses: courses,
      cups: cups,
    ));
  }

  Future<List<T>> _loadData<T>(
    String file,
    T Function(Map<String, dynamic>) fromJson,
  ) async {
    final raw = await rootBundle.loadString('assets/data/$file.json');
    final data = json.decode(raw) as List;

    return data.map((e) => fromJson(e)).toList();
  }
}
