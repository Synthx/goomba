import 'dart:convert';

import 'package:goomba/core/core.dart';
import 'package:goomba/data/data.dart';

class PlayerService {
  Future<Page<Player>> findAll() async {
    final response = await http.get('/api/players');
    final List<dynamic> data = jsonDecode(response.data);
    final players = data.map((doc) => Player.fromJson(doc.data())).toList();

    return Page(
      content: players,
      numberOfElements: players.length,
      totalElements: players.length,
    );
  }
}
